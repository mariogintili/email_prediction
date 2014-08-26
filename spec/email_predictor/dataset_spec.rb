require "spec_helper"

describe EmailPredictor::DataSet do

  subject { DataSet.new(data) }

  let(:data) do
    {
      "John Ferguson" => "john.ferguson@alphasights.com",
      "Damon Aw" => "damon.aw@alphasights.com",
      "Linda Li" => "linda.li@alphasights.com",
    }
  end

  context "#initialize" do

    it "takes in a hash and sets it as an attribute" do
      expect(subject.data).to eq data
    end
  end

  context "#emails" do

    let(:linda_email) { data["Linda Li"] }
    let(:john_email)  { data["John Ferguson"] }

    it "maps all values to emails" do
      emails = subject.emails.map(&:address)
      expect(emails).to include linda_email
      expect(emails).to include john_email
    end
  end

  context "#names" do

    let(:all_names) { data.keys }

    it "maps all the keys to names" do
      names = subject.names.map(&:full_name)
      expect(names).to match_array all_names
    end
  end
end