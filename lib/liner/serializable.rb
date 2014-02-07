module Liner
  module Serializable
    # Convert a liner instances attributes to json
    # @return [String] A JSON string of attributes
    # @api public
    def to_json(*args)
      as_json.to_json(*args)
    end
    
    private

    # @api private
    def as_json(*)
      to_h
    end
  end
end
