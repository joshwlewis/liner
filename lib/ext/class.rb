Class.class_eval do
  def liner(*keys)
    keys = keys.map(&:to_sym)
    define_method(:liner_keys){ keys }
    include Liner
    keys.each do |key|
      define_method(key){ self[key] }
      define_method("#{key}="){ |value| self[key] = value }
    end
  end
end
