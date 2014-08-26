module EmailPredictor
  class Prediction

    attr_reader :name, :domain

    def initialize(full_name, full_domain)
      @name   = Name.new full_name
      @domain = Domain.new full_domain
    end

    def first_name_dot_last_name
      @first_name_dot_last_name ||= Email.new address_for_first_name_dot_last_name
    end

    def first_name_dot_last_initial
      @first_name_dot_last_initial ||= Email.new address_for_first_name_dot_last_initial
    end

    def first_initial_dot_last_name
      @first_initial_dot_last_name ||= Email.new address_for_first_initial_dot_last_name
    end

    def first_initial_dot_last_initial
      @first_initial_dot_last_initial ||= Email.new address_for_first_initial_dot_last_initial
    end

    private

    def address_for_first_name_dot_last_name
      local = name.to_a.join('.')
      [local, domain.full_domain].join("@")
    end

    def address_for_first_name_dot_last_initial
      local = [name.first, name.initials.last].join(".") 
      [local, domain.full_domain].join("@")
    end

    def address_for_first_initial_dot_last_name
      local = [name.initials.first, name.last].join(".")
      [local, domain.full_domain].join("@") 
    end

    def address_for_first_initial_dot_last_initial
      local = name.initials.join(".")
      [local, domain.full_domain].join("@")
    end
  end
end