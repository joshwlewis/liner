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
  subject { Beer.new(name: "Pabst") }
  it "::new must create a new instance" do
    subject.must_be_instance_of Beer
    subject.must_be_kind_of Liner
  end

  it "#[] should read attributes" do
    subject[:name].must_equal "Pabst"
  end

  it "#[]= should set attributes" do
    subject[:name]= "High Life"
    subject.name.must_equal "High Life"
  end

  it "#[]= should not set invalid attributes" do
    ->{ subject[:foo] = 'bar' }.must_raise ArgumentError
  end

  it "#inspect must include all attributes" do
    subject.inspect.must_equal '#<Beer name="Pabst">'
  end

  describe "#==" do
    it "should return true when hashes are equal" do
      Beer.new(name: 'Spaten').must_equal Beer.new(name: 'Spaten')
    end
    it "should return false when hashes are not equal" do
      Beer.new(name: 'Spaten').wont_equal Beer.new(name: 'Paulaner')
    end
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
