describe Liner::Hashable do
  Beer = Liner.new(:name, :description)
  subject { Beer.new(name: 'Pabst') }

  it "#[] should read attributes" do
    subject[:name].must_equal "Pabst"
    subject[:description].must_equal nil
  end

  it "#[]= should set attributes" do
    subject[:name]= "High Life"
    subject.name.must_equal "High Life"
  end

  it "#[]= should not set invalid attributes" do
    ->{ subject[:foo] = 'bar' }.must_raise ArgumentError
  end

  it "liner should be a hash of attributes" do
    subject.liner.must_equal({ name: 'Pabst', description: nil })
  end

  it "liner= should set the attributes" do
    hash = {name: 'High Life', description: 'Lager' }
    subject.liner = hash
    subject.liner.must_equal(hash)
  end

  it "#to_h should return the attribute hash" do
    subject.to_h.must_equal({ name: 'Pabst', description: nil })
  end

end
