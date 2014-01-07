module Liner
  module Base
    def initialize(*args)
      if args.count == 1 && args.first.respond_to?(:keys)
        self.liner = args.first
      elsif args.count >= 1 && args.count <= liner_keys.count
        self.liner_values = args
      else
        raise ArgumentError, "Liner doesn't know how to initialize with `#{args}`."
      end
    end
  end
end
