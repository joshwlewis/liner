module Liner
  module Hashable

    def [](key)
      send key.to_sym
    rescue NoMethodError
      read_attribute key
    end

    def []=(key,value)
      send :"#{key}=", value
    rescue NoMethodError
      write_attribute key, value
    end

    def hash
      keys.inject({}) { |h,k| h[k] = self[k]; h }.freeze
    end

    def hash=(hash)
      hash.each { |k,v| self[k] = hash[k] }
    end

    def values=(values)
      values.each_with_index do |value, i|
        write_attribute(keys[i], value)
      end
    end

    def to_h
      hash.dup
    end
    alias :to_hash :to_h
    
  end
end
