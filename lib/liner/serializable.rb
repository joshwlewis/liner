module Liner
  module Serializable
    def as_json(*)
      to_h
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end
