require "spec_helper"

describe EmailPredictor::Domain do

  let(:full_domain) { "alphasights.com" }

  subject { Domain.new(full_domain) }

  context "#initialize" do

    it "takes in a string and sets it as an attribute" do
      expect(subject.full_domain).to eq full_domain
    end
  end
end