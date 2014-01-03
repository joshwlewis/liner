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
  base.class_eval do
    define_method(:liner_keys){ keys }
    include Liner
    keys.each do |key|
      define_method(key){ self[key] }
      define_method("#{key}="){ |value| self[key] = value }
    end
  end
  base
end
