module Liner
  module Inspectable
    # A handy inspection string
    # @return [String]
    # @api public
    def inspect
      attribute_string = liner.map{|k,v| "#{k}=#{v.inspect}"}.join(', ')
      "#<#{self.class} #{attribute_string}>"
    end
    alias :to_s :inspect
  end
end
