require "spec_helper"

describe EmailPredictor::PatternScanner do

  subject(:patttern_scanner) { PatternScanner.new(name: name, email: email)}
  let(:name)                 { Name.new('Wu Tang')}
  let(:email)                { Email.new(address: 'X.tang@something.com') }

  describe "#predicted_pattern" do

    context 'with an unpredicted pattern' do

      it "returns nil" do
        expect(patttern_scanner.predicted_pattern).to eq nil
      end
    end

    context 'with a predictable pattern' do

      shared_examples "predictable pattern" do

        it "returns a symbol corresponding to its pattern" do
          expect(subject.predicted_pattern).to eq pattern
        end
      end

      context "first_name_dot_last_name" do

        let(:email)   { Email.new(address: "john.ferguson@alphasights.com") }
        let(:name)    { Name.new('John Ferguson')}
        let(:pattern) { :first_name_dot_last_name }

        it_behaves_like "predictable pattern"
      end

      context "first_name_dot_last_initial" do

        let(:email)   { Email.new(address: "john.f@alphasights.com") }
        let(:name)    { Name.new('John Ferguson')}
        let(:pattern) { :first_name_dot_last_initial }

        it_behaves_like "predictable pattern"
      end

      context "first_initial_dot_last_name" do

        let(:email)   { Email.new(address: "j.ferguson@alphasights.com") }
        let(:name)    { Name.new('John Ferguson')}
        let(:pattern) { :first_initial_dot_last_name }

        it_behaves_like "predictable pattern"
      end

      context "first_initial_dot_last_initial" do

        let(:email)   { Email.new(address: "j.f@alphasights.com") }
        let(:name)    { Name.new('John Ferguson')}
        let(:pattern) { :first_initial_dot_last_initial }

        it_behaves_like "predictable pattern"
      end
    end
  end
end
