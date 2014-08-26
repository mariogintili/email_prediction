require "spec_helper"

describe EmailPredictor::Prediction do

  subject { Prediction.new(email) }

  let(:address)  { "john.ferguson@alphasights.com" }
  let(:email)    { Email.new(address) }

  context "#initialize" do

    it "takes an email and sets it as an attribute" do
      expect(subject.email).to eq email
    end
  end
end