module Liner
  module Inspectable
    def inspect
      attribute_string = hash.map{|k,v| "#{k}=#{v.inspect}"}.join(', ')
      "#<#{self.class} #{attribute_string}>"
    end
    alias :to_s :inspect
  end
end
