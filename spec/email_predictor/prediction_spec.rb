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


  shared_examples "predictable pattern" do

    it "creates an email with the expected address" do
      expect(Email).to receive(:new).with(predicted_address)
      predict_email
    end
  end

  let(:domain) { "alphasights.com" }
  let(:name)   { "Peter Wong" }

  context "#first_name_dot_last_name" do

    subject(:predict_email) do
      Prediction.new(name, domain).first_name_dot_last_name
    end

    let(:predicted_address) { "peter.wong@alphasights.com" }

    it_behaves_like "predictable pattern"
  end

  context "#first_name_dot_last_initial" do

    subject(:predict_email) do
      Prediction.new(name, domain).first_name_dot_last_initial
    end

    let(:predicted_address) { "peter.w@alphasights.com" }

    it_behaves_like "predictable pattern"
  end

  context "#first_initial_dot_last_name" do

    subject(:predict_email) do
      Prediction.new(name, domain).first_initial_dot_last_name
    end

    let(:predicted_address) { "p.wong@alphasights.com" }

    it_behaves_like "predictable pattern"
  end
end