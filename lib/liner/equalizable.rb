module Liner
  module Equalizable
    def ==(other)
      return false unless other.class == self.class
      liner == other.liner
    end

    def eql?(other)
      return false unless other.class == self.class
      liner.eql?(other.liner)
    end
  end
end
