module Liner
  module Hashable

    def liner
      @liner ||= liner_keys.inject({}) { |h,k| h[k]=nil; h }
    end

    def liner=(hash)
      hash.each { |k,v| self[k] = hash[k] }
    end

    def [](key)
      liner[key.to_sym]
    end

    def []=(key,value)
      key = key.to_sym
      if liner_keys.include?(key)
        liner[key] = value
      else
        raise ArgumentError, "Invalid liner attribute: '#{key}'."
      end
    end

    def liner_values=(values)
      values.each_with_index do |v,i|
        self[liner_keys[i]] = v
      end
    end

    def to_h
      liner.dup
    end
    alias :to_hash :to_h
    
  end
end
