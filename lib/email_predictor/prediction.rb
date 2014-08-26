module EmailPredictor
  class Prediction

    attr_reader :name, :domain

    def initialize(name, domain)
      @name   = name
      @domain = domain 
    end
  end
end