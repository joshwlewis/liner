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
    define_method :keys do
      begin
        (super() + keys).uniq
      rescue NoMethodError
        keys
      end
    end
    include Liner
    keys.each do |key|
      define_method(key){ read_attribute(key) }
      define_method("#{key}="){ |value| write_attribute(key, value) }
    end
  end
  base
end
