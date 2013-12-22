require 'minitest/autorun'

describe Liner do
  it "::new_subclass must create a new class" do
    Liner.new_subclass(:a).must_be :<, Liner
  end

  it "::new must create a new class" do
    Liner.new(:a).must_be :<, Liner
  end
end

class Beer < Liner.new(:name)
end

describe Beer do
  subject { Beer.new(name: "High Life") }
  it "::new must create a new instance" do
    subject.must_be_instance_of Beer
    subject.must_be_kind_of Liner
  end
  it "#name must return the name" do
    subject.name.must_equal "High Life"
  end
end

PaleAle = Beer.new_subclass(:hops)
describe PaleAle do
  subject { PaleAle.new(name: "Sierra Nevada", hops: "Cascade") }

  it "::new must create a new instance" do
    subject.must_be_instance_of PaleAle
    subject.must_be_kind_of Beer
    subject.must_be_kind_of Liner
  end

  it "#name must get the name" do
    subject.name.must_equal "Sierra Nevada"
  end

  it "#hops must get the hops" do
    subject.hops.must_equal "Cascade"
  end

  it "#hops= must set the hops" do
    subject.hops = nil
    subject.hops.must_equal nil
  end

end
