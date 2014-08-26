require "spec_helper"

describe EmailPredictor::Prediction do

  subject { Prediction.new(name, domain) }
  
  context "#initialize" do

    let(:domain) { "alphasights.com" }
    let(:name)   { "Peter Wong" }

    it "takes a name and a domain and sets it as an attribute" do
      expect(subject.name).to eq name
      expect(subject.domain).to eq domain
    end
  end

  context "Predicting email, potential patterns" do

    let(:domain) { "alphasights.com" }
    let(:name)   { "Peter Wong" }

    context "#first_name_dot_last_name" do

      let(:predicted_address) { "peter.wong@alphasights.com" }

      it "creates an email with the target's full name" do
        expect(Email).to receive(:new).with(predicted_address)
        subject.first_name_dot_last_name
      end
    end

    context "#first_name_dot_last_initial" do

      let(:predicted_address) { "peter.w@alphasights.com" }

      it "#first_name_dot_last_initial" do
        expect(Email).to receive(:new).with(predicted_address)
        subject.first_name_dot_last_initial
      end
    end
  end
end