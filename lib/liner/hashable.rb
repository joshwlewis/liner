module Liner
  module Hashable

    def [](key)
      send key.to_sym
    rescue NoMethodError
      read_liner key
    end

    def []=(key,value)
      send :"#{key}=", value
    rescue NoMethodError
      write_liner key, value
    end

    def liner
      liner_keys.inject({}) { |h,k| h[k] = self[k]; h }.freeze
    end

    def liner=(hash)
      hash.each { |k,v| self[k] = hash[k] }
    end

    def liner_values=(values)
      values.each_with_index do |value, i|
        write_liner(liner_keys[i], value)
      end
    end

    def to_h
      liner.dup
    end
    alias :to_hash :to_h
    
  end
end
