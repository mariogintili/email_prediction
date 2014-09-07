module EmailPredictor
  class DataSet

    attr_reader :data

    def initialize(data = nil)
      @data = data || DATA
    end

    def emails
      data.map do |full_name,  address| 
        email = Email.new(address: address)
        name  = Name.new(full_name)
        email.pattern = PatternScanner.new(email: email, name: name).predicted_pattern
        email
      end
    end

    def names
      data.keys.map { |full_name| Name.new(full_name) }
    end
  end
end