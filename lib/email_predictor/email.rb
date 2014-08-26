module EmailPredictor
  class Email

    attr_reader :address

    def initialize(address)
      @address = address
    end

    def domain
      @domain ||= extract_domain
    end

    def local
      @local ||= extract_local
    end

    private

    def extract_domain
      address.split(/@/).last
    end

    def extract_local
      address.split(/@/).first
    end
  end
end