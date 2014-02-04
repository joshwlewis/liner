module Liner
  module Equalizable
    def ==(other)
      return false unless other.class == self.class
      hash == other.hash
    end

    def eql?(other)
      return false unless other.class == self.class
      hash.eql?(other.hash)
    end
  end
end
