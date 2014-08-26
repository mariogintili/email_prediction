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

    def pattern
      case
        when first_name_dot_last_name?
          :first_name_dot_last_name
        when first_name_dot_last_initial?
          :first_name_dot_last_initial
        when first_initial_dot_last_name?
          :first_initial_dot_last_name
        when first_initial_dot_last_initial?
          :first_initial_dot_last_initial
        else
          raise NotImplementedError
      end 
    end

    private

    def first_name_dot_last_name?
      local.split(".").map { |word| word.length > 1}.all? { |bool| bool == true }
    end

    def first_name_dot_last_initial?
      last_is_initial = local.split(".").last.length == 1
      first_is_name   = local.split(".").first.length > 1
      first_is_name && last_is_initial
    end

    def first_initial_dot_last_name?
      first_is_initial = local.split(".").first.length == 1
      last_is_name     = local.split(".").last.length > 1 
      first_is_initial && last_is_name
    end

    def first_initial_dot_last_initial?
      local.split(".").map { |word| word.length == 1 }.all? { |bool| bool == true }
    end

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