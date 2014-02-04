require 'liner/version'
require 'liner/base'
require 'liner/hashable'
require 'liner/equalizable'
require 'liner/inspectable'
require 'liner/serializable'
require 'ext/class'

module Liner
  def self.included(base)
    [Base, Hashable, Equalizable, Inspectable, Serializable].each do |mod|
      base.send :include, mod
    end
  end
end

def Liner.new(*keys)
  apply Class.new, *keys
end

def Liner.apply(base, *keys)
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
      base.send(:define_method, key){ read_liner(key) }
    end
    unless base.method_defined? "#{key}="
      base.send(:define_method, "#{key}="){ |value| write_liner(key, value) }
    end
  end
  base
end
