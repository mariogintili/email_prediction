require "spec_helper"

describe EmailPredictor::Name do

  subject { Name.new(full_name) }

  let(:full_name) { "Pete Wong" }

  context "#initialize" do

    it "takes a string and sets it as an attribute" do
      expect(subject.full_name).to eq full_name
    end
  end
end