module Liner
  module Base
    # Create a new instance of a Liner class
    # @param args [Hash, Array, nil] A hash of attribute-value pairs, an array of values or nil
    # @return [Class] A new instance of the Liner class
    def initialize(*args)
      if args.count == 1 && args.first.respond_to?(:keys)
        self.liner = args.first
      elsif args.count >= 1 && args.count <= liner_keys.count
        self.liner_values = args
      end
    end
  end

  private

  # Get a liner attribute.
  # @param key [Symbol, String] The attribute to be read
  # @return value [Object] The value of the attribute
  # @api private
  def liner_get(key)
    key = key.to_sym
    with_valid_attribute(key) do
      instance_variable_get "@#{key}"
    end
  end

  # Set a liner attribute
  # @param key [Symbol, String] The attribute to be set
  # @param value [Object] The value to set the attribute to
  # @return value [Object]
  # @api private
  def liner_set(key, value)
    key = key.to_sym
    with_valid_attribute(key) do
      instance_variable_set "@#{key}", value
    end
  end

  # Raise an error unless the key exists
  # @api private
  def with_valid_attribute(key, &block)
    if liner_keys.include?(key)
      yield
    else
      raise ArgumentError, "Invalid liner attribute: '#{key}'"
    end
  end
end
