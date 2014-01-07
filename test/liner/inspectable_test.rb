describe Liner::Inspectable do
  subject { Cheeseburger.new(meat: 'turkey') }
  it "#inspect must include all attributes" do
    subject.inspect.must_equal '#<Cheeseburger bun=nil, meat="turkey", cheese=nil>'
  end
  it "#to_s must include all attributes" do
    subject.to_s.must_equal '#<Cheeseburger bun=nil, meat="turkey", cheese=nil>'
  end
end
