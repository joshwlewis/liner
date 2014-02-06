module Liner
  module Base
    def initialize(*args)
      if args.count == 1 && args.first.respond_to?(:keys)
        self.liner = args.first
      elsif args.count >= 1 && args.count <= liner_keys.count
        self.liner_values = args
      end
    end
  end

  private

  def liner_get(key)
    key = key.to_sym
    with_valid_attribute(key) do
      instance_variable_get "@#{key}"
    end
  end

  def liner_set(key, value)
    key = key.to_sym
    with_valid_attribute(key) do
      instance_variable_set "@#{key}", value
    end
  end

  def with_valid_attribute(key, &block)
    if liner_keys.include?(key)
      yield
    else
      raise ArgumentError, "Invalid liner attribute: '#{key}'"
    end
  end
end
