Class.class_eval do
  def liner(*keys)
    Liner.apply self, *keys
  end
end
