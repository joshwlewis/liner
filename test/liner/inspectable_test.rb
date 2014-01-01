describe Liner::Inspectable do
  subject { Burger.new(type: 'turkey') }
  it "#inspect must include all attributes" do
    subject.inspect.must_equal '#<Burger type="turkey", cheese=nil>'
  end
  it "#to_s must include all attributes" do
    subject.to_s.must_equal '#<Burger type="turkey", cheese=nil>'
  end
end
