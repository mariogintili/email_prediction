module EmailPredictor
  class DataSet

    attr_reader :data

    def initialize(data = nil)
      @data = data || DATA
    end

    def emails
      data.values.map { |address| Email.new(address: address) }
    end

    def names
      data.keys.map { |full_name| Name.new(full_name) }
    end
  end
end