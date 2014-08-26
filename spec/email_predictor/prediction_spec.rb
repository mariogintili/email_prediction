require "spec_helper"

describe EmailPredictor::Prediction do

  subject { Prediction.new(name, domain) }
  
  context "#initialize" do

    let(:domain) { "alphasights.com" }
    let(:name)   { "Peter Wong" }

    it "takes a name and a domain and sets them as attributes" do
      expect(Name).to receive(:new).with name
      expect(Domain).to receive(:new).with domain
      subject
    end
  end

  context "#predicted_email" do

    context "with no other entries in the dataset" do

      let(:name)              { "Barack Obama" }
      let(:domain)            { "whitehouse.gov" }           

      it "raises a NotImplementedError" do
        expect{subject.predicted_email}.to raise_error NotImplementedError
      end
    end

    context "with other entries in the dataset" do

      context "with predominant known patterns" do

        let(:name)              { "Peter Wong" }
        let(:domain)            { "alphasights.com" }           
        let(:predicted_address) { "peter.wong@alphasights.com" }
        
        it "creates an email, with the most likely local" do
          expect(subject.predicted_email.address).to eq predicted_address
        end
      end

      context "with non-predominant known patterns" do

        let(:name)              { "Craig Silverstein" }
        let(:domain)            { "google.com" }           
        let(:predicted_address) { "craig.s@google.com" }

        it "returns an email with a non-predominant pattern" do
          expect(subject.predicted_email.address).to eq predicted_address
        end
      end
    end
  end
end