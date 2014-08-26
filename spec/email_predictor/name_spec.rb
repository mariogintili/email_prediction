require "spec_helper"

describe EmailPredictor::Name do

  subject { Name.new(full_name) }

  let(:full_name) { "Pete Wong" }

  context "#initialize" do

    it "takes a string and sets it as an attribute" do
      expect(subject.full_name).to eq full_name
    end
  end

  context "#initials" do

    let(:initials) { ["p", "w"] }

    it "returns an array with the initials" do
      expect(subject.initials).to match_array initials
    end
  end

  context "#first" do

    it "returns the first name downcased" do
      expect(subject.first).to eq "pete"
    end
  end

  context "#last" do

    it "returns the last name, downcased" do
      expect(subject.last).to eq "wong"
    end
  end

  context "#to_a" do

    it "returns an array containg the first and last name downcased" do
      expect(subject.to_a).to eq ["pete", "wong"]
    end
  end
end