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
      EmailPredictor::PredictedEmail.new(address: address, pattern: pattern)
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

    def join_domain(local)
      [local, domain.full_domain].join('@')
    end

    def address_for_first_name_dot_last_name
      join_domain(first_name_dot_last_name)
    end

    def first_name_dot_last_name
      name.to_a.join('.')
    end

    def first_name_dot_last_initial
      [name.first, name.initials.last].join(".") 
    end

    def address_for_first_name_dot_last_initial
      join_domain(first_name_dot_last_initial)
    end

    def first_initial_dot_last_name
      [name.initials.first, name.last].join(".")
    end

    def address_for_first_initial_dot_last_name
      join_domain(first_initial_dot_last_name)
    end

    def first_initial_dot_last_initial
      name.initials.join(".")
    end

    def address_for_first_initial_dot_last_initial
      join_domain(first_initial_dot_last_initial)
    end
  end
end