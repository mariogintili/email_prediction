module EmailPredictor
  class EmailFactory

    attr_reader :pattern, :name, :domain

    def build(options)
      @pattern = options[:pattern]
      @name    = options[:name]
      @domain  = options[:domain]
      create_email
    end

    private

    def create_email
      address = address_for pattern
      Email.new(address)
    end

    def address_for pattern
      case pattern
        when :first_name_dot_last_name
          address_for_first_name_dot_last_name
        when :first_name_dot_last_initial
          address_for_first_name_dot_last_initial
        when :first_initial_dot_last_name
          address_for_first_initial_dot_last_name
        when :first_initial_dot_last_initial
          address_for_first_initial_dot_last_initial
        else
          raise NotImplementedError 
      end
    end

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