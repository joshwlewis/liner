module Liner
  module Equalizable

    # Test equality between a liner class instance and another object
    # @param other [Object]
    # @return [true, false]
    def ==(other)
      return false unless other.class == self.class
      liner == other.liner
    end

    # Test equality between a liner class instance and another object
    # @param other [Object]
    # @return [true, false]
    def eql?(other)
      return false unless other.class == self.class
      liner.eql?(other.liner)
    end
  end
end
