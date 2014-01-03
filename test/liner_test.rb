describe Liner do
  describe :new do
    let(:beer)  { Beer.new(hops: 'columbus') }
    let(:pizza) { Pizza.new(crust: 'thin') }
    let(:burger){ Burger.new(bun: 'sesame') }

    it "should create a new class" do
      [Beer, Pizza, Burger].all?{|klass| klass.is_a? Class }
    end

    it "should define liner_keys" do
      beer.liner_keys.must_equal   [:hops, :yeast]
      pizza.liner_keys.must_equal  [:crust, :sauce]
      burger.liner_keys.must_equal [:bun, :meat, :cheese]
    end

    it "should define attribute getters" do
      beer.must_respond_to   :hops
      pizza.must_respond_to  :sauce
      burger.must_respond_to :meat
    end

    it "should define attribute setters" do
      beer.must_respond_to   :yeast=
      pizza.must_respond_to  :crust=
      burger.must_respond_to :bun=
    end

  end
end
