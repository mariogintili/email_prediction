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

    def hostname
      @hostname ||= extract_hostname
    end

    private

    def extract_hostname
      domain.split('.').first
    end

    def extract_domain
      address.split('@').last
    end

    def extract_local
      address.split('@').first
    end
  end
end