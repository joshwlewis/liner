describe Liner::Inspectable do
  subject { Cheeseburger.new(:meat => 'turkey') }
  it "#inspect must include all attributes" do
    subject.to_s.must_match(/#\<Cheeseburger\ .*\>/)
    subject.to_s.must_include 'bun=nil'
    subject.to_s.must_include 'meat="turkey"'
    subject.to_s.must_include 'cheese=nil'
  end
  it "#to_s must include all attributes" do
    subject.to_s.must_match(/#\<Cheeseburger\ .*\>/)
    subject.to_s.must_include 'bun=nil'
    subject.to_s.must_include 'meat="turkey"'
    subject.to_s.must_include 'cheese=nil'
  end
end
