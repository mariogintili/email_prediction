require "spec_helper"

describe EmailPredictor::Prediction do

  context "#initialize" do

    subject { Prediction.new(name, domain) }

    let(:domain) { "alphasights.com" }
    let(:name)   { "Peter Wong" }

    it "takes a name and a domain and sets it as an attribute" do
      expect(subject.name).to eq name
      expect(subject.domain).to eq domain
    end
  end
end