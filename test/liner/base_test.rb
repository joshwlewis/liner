describe Liner::Base do
  describe :initialize do
    it "should accept key/value pairs" do
      beer = Beer.new(hops: 'Cascade', yeast: 'Top Fermenting')
      beer.hops.must_equal 'Cascade'
      beer.yeast.must_equal 'Top Fermenting'
    end
    it "should accept a list of values" do
      burger = Burger.new('Sesame Seed', 'Soy', 'Cheddar')
      burger.bun.must_equal 'Sesame Seed'
      burger.cheese.must_equal 'Cheddar'
    end
  end
end
