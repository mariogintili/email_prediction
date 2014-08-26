module EmailPredictor
  class DataSet

    attr_reader :data

    def initialize(data)
      @data = data || DATA
    end
  end
end