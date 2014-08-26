module EmailPredictor
  class Domain

    attr_reader :full_domain

    def initialize(full_domain)
      @full_domain = full_domain
    end
  end
end