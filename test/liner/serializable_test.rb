require 'json'
describe Liner::Serializable do
  subject { Pizza.new 'thin', 'tomato' }
  describe :to_json do
    it "should render a json string" do
      subject.to_json.must_match /\{.*\}/
      subject.to_json.must_include '"crust":"thin"'
      subject.to_json.must_include '"sauce":"tomato"'
      subject.to_json.must_equal "{\"crust\":\"thin\",\"sauce\":\"tomato\"}"
    end
  end
end
