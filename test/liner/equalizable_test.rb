describe Liner::Equalizable do
  subject { Pizza.new(:crust => 'thin', :sauce => 'tomato') }
  describe "#==" do
    it "should return true when hashes are equal" do
      subject.must_be :==, Pizza.new(:crust => 'thin', :sauce => 'tomato')
    end
    it "should return false when hashes are not equal" do
      subject.wont_be :==, Pizza.new(:crust => 'thick', :sauce => 'alfredo')
    end
  end
  describe "#eql?" do
    it "should return true when hashes are equal" do
      subject.must_be :eql?, Pizza.new(:crust => 'thin', :sauce => 'tomato')
    end
    it "should return false when hashes are not equal" do
      subject.wont_be :eql?, Pizza.new(:crust => 'thick', :sauce => 'alfredo')
    end
  end
end
