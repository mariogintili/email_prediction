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
end