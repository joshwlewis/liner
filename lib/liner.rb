require 'liner/version'
require 'liner/base'
require 'liner/hashable'
require 'liner/equalizable'
require 'liner/inspectable'
require 'liner/serializable'
require 'ext/class'

module Liner
  # include all submodules when included
  # @api public
  def self.included(base)
    [Base, Hashable, Equalizable, Inspectable, Serializable].each do |mod|
      base.send :include, mod
    end
  end
end

# Setup an anonymous class with liner keys
# @param keys [Array] An array of symbols or strings which will serve as attributes
# @return [Class]
# @example Liner.new(:foo) # => #<Class:0x007fd0993bab98>
# @api public
def Liner.new(*keys)
  apply! Class.new, *keys
end

# Apply a liner to a given class
# @param base [Class] A class to add a liner to
# @param keys [Array] An array of symbols or strings which will serve as attributes
# @return [Class] The class with a liner installed
# @api public
def Liner.apply!(base, *keys)
  keys = keys.map(&:to_sym).uniq.freeze

  base.send(:define_method, :liner_keys) do
    begin
      (super() + keys).uniq
    rescue NoMethodError
      keys
    end
  end

  base.send :include, Liner unless base < Liner

  keys.each do |key|
    unless base.method_defined? key
      base.send(:define_method, key){ liner_get key }
    end
    unless base.method_defined? "#{key}="
      base.send(:define_method, "#{key}="){ |value| liner_set key, value }
    end
  end
  base
end
