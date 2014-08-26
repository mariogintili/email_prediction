require "spec_helper"

describe EmailPredictor::EmailFactory do

  context "#build" do

    subject(:build_email) do 
      EmailFactory.new.build(options)
    end

    let(:full_name)   { "Peter Wong" }
    let(:name)        { Name.new(full_name) }
    let(:full_domain) { "alphasights.com" }
    let(:domain)      { Domain.new(full_domain) }

    let(:options) do
      {
        name: name,
        domain: domain,
        pattern: pattern
      }
    end

    shared_examples "predictable pattern" do

      it "creates an email from the given pattern" do
        expect(Email).to receive(:new).with(predicted_address)
        build_email
      end
    end


    context "first_name_dot_last_name" do

      let(:predicted_address) { "peter.wong@alphasights.com" }
      let(:pattern)           { :first_name_dot_last_name }

      it_behaves_like "predictable pattern"
    end

    context "first_name_dot_last_initial" do

      let(:predicted_address) { "peter.w@alphasights.com"}
      let(:pattern)           { :first_name_dot_last_initial }

      it_behaves_like "predictable pattern"
    end

    context "first_initial_dot_last_name" do

      let(:predicted_address) { "p.wong@alphasights.com" }
      let(:pattern)           { :first_initial_dot_last_name }

      it_behaves_like "predictable pattern"
    end

    context "first_initial_dot_last_initial" do

      let(:predicted_address) { "p.w@alphasights.com" }
      let(:pattern)           { :first_initial_dot_last_initial }

      it_behaves_like "predictable pattern"
    end
  end
end