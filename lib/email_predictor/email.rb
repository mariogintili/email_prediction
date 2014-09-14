module EmailPredictor
  class Email

    attr_accessor :address, :pattern


    def initialize(args)
      @address = args[:address]
    end

    def domain
      @domain ||= address.split('@').last
    end

    def local
      @local ||= address.split('@').first
    end

    def first_local
      local.split('.').first
    end

    def hostname
      @hostname ||= domain.split('.').first
    end
  end
end