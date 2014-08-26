require "spec_helper"

describe EmailPredictor::Email do

  let(:address) { "john.ferguson@alphasights.com" }
  let(:args)    { {address: address} }
  
  subject { Email.new(args) }
  
  context "#initialize" do

    it "takes a string and sets it as an attribute" do
      expect(subject.address).to eq address
    end
  end

  context "#domain" do

    it "returns the full domain" do
      expect(subject.domain).to eq "alphasights.com"
    end
  end

  context "#local" do

    it "returns the local" do
      expect(subject.local).to eq "john.ferguson"
    end
  end

  context "#hostname" do

    it "keeps the domain" do
      expect(subject.hostname).to include "alphasights"
    end

    it "doesnt include the top-level domain" do
      expect(subject.hostname).not_to include ".com"
    end
  end

  context "#pattern" do

    shared_examples "predictable pattern" do

      it "returns a symbol corresponding to its pattern" do
        expect(subject.pattern).to eq pattern
      end
    end

    context "first_name_dot_last_name" do

      let(:address) { "john.ferguson@alphasights.com" }
      let(:pattern) { :first_name_dot_last_name }
      
      it_behaves_like "predictable pattern"
    end

    context "first_name_dot_last_initial" do

      let(:address) { "john.f@alphasights.com" }
      let(:pattern) { :first_name_dot_last_initial }

      it_behaves_like "predictable pattern"
    end

    context "first_initial_dot_last_name" do

      let(:address) { "j.ferguson@alphasights.com" }
      let(:pattern) { :first_initial_dot_last_name }

      it_behaves_like "predictable pattern"
    end

    context "first_initial_dot_last_initial" do

      let(:address) { "j.f@alphasights.com" }
      let(:pattern) { :first_initial_dot_last_initial }

      it_behaves_like "predictable pattern"
    end
  end
end