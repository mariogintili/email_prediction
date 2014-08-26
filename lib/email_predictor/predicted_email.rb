module EmailPredictor
  class PredictedEmail < Email

    attr_reader :address, :pattern

    def initialize(args)
      @address = args[:address]
      @pattern = args[:pattern]
    end
  end
end