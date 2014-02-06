describe Liner::Hashable do
  subject { Beer.new(hops: 'Cascade') }

  it "#[] should read attributes" do
    subject[:hops].must_equal "Cascade"
    subject[:yeast].must_equal nil
  end

  it "[] should not read invalid attributes" do
    ->{ subject[:foo] }.must_raise ArgumentError
  end

  it "#[]= should set attributes" do
    subject[:yeast]= "Top Fermenting"
    subject.yeast.must_equal "Top Fermenting"
  end

  it "#[]= should not set invalid attributes" do
    ->{ subject[:foo] = 'bar' }.must_raise ArgumentError
  end

  it "liner should be a hash of attributes" do
    subject.liner.must_equal({ hops: 'Cascade', yeast: nil })
  end

  it "liner= should set the attributes" do
    hash = {hops: 'Columbus', yeast: 'Bottom Fermenting' }
    subject.liner = hash
    subject.liner.must_equal(hash)
  end

  it "#to_h should return the attribute hash" do
    subject.to_h.must_equal({ hops: 'Cascade', yeast: nil })
  end

end
