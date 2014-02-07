module Liner
  module Hashable

    # Read a liner attribute
    # @param key [Symbol, String] The attribute to fetch the value for
    # @return [Object] The attribute value
    # @api public
    def [](key)
      send key.to_sym
    rescue NoMethodError
      liner_get key
    end

    # Set a liner attribute
    # @param key [Symbol, String] The attribute to set the value for
    # @param value [Object] The attribute value to set
    # @return [Object] The attribute value
    # @api public
    def []=(key,value)
      send :"#{key}=", value
    rescue NoMethodError
      liner_set key, value
    end

    # Build a hash of liner attributes
    # @return [Hash] A hash of liner attributes
    # @api public
    def liner
      liner_keys.inject({}) { |h,k| h[k] = self[k]; h }.freeze
    end

    # Set multiple attribute values
    # @param hash [Hash] A hash of attribute-value pairs to set
    # @return [Hash]
    # @api public
    def liner=(hash)
      hash.each { |k,v| self[k] = hash[k] }
    end

    # Set mulitple attribute values
    # @param values [Array] Ordered array of attribute values
    # @return [Array]
    # @api public
    def liner_values=(values)
      values.each_with_index do |value, i|
        self[liner_keys[i]] = value
      end
    end

    # Get a hash of attributes
    # @return [Hash] An attribute-value hash
    # @api public
    def to_h
      liner.dup
    end
    alias :to_hash :to_h
    
  end
end
