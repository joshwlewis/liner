require 'liner/version'
require 'liner/base'
require 'liner/hashable'
require 'liner/equalizable'
require 'liner/inspectable'
require 'liner/serializable'
require 'ext/class'

module Liner
  def self.new(*keys)
    keys = keys.map(&:to_sym)
    Class.new do |klass|
      define_method(:liner_keys){ keys }
      klass.send :include, Liner
      keys.each do |key|
        define_method(key){ self[key] }
        define_method("#{key}="){ |value| self[key] = value }
      end
    end
  end

  def self.included(base)
    [Base, Hashable, Equalizable, Inspectable, Serializable].each do |mod|
      base.send :include, mod
    end
  end
end
