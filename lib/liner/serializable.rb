module Liner
  module Serializable
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def json_create(o)
        new o['liner']
      end
    end

    def as_json(*)
      { 'json_class' => self.class.name, 'liner' => liner }
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end
