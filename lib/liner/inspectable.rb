module Liner
  module Inspectable
    # A handy inspection string
    # @return [String]
    # @api public
    def inspect
      "#<#{self.class} #{attribute_string}>"
    end
    alias :to_s :inspect

    # List all the liner attributes as a string, used for inspection.
    # @return [String]
    # @api private
    def attribute_string
      liner.map { |k,v| "#{k}=#{v.inspect}" }.join(', ')
    end
    private :attribute_string
  end
end
