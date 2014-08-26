module EmailPredictor
  class Prediction

    attr_reader :name, :domain

    def initialize(name, domain)
      @name   = name
      @domain = domain 
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
      [name.downcase.gsub(' ', '.'), domain].join("@")
    end

    def address_for_first_name_dot_last_initial
      index_of_initial = name.rindex(' ') + 1
      local            = name.downcase[0..index_of_initial].gsub(' ', '.')
      [local, domain].join("@")
    end

    def address_for_first_initial_dot_last_name
      initial   = name.downcase.chars.first
      last_name = name.downcase.split(" ").last 
      local     = [initial, last_name].join(".")
      [local, domain].join("@") 
    end

    def address_for_first_initial_dot_last_initial
      first_initial         = name.downcase.chars.first
      index_of_last_initial = name.rindex(' ') + 1
      last_initial          = name.downcase[index_of_last_initial]
      local                 = [first_initial, last_initial].join(".")
      [local, domain].join("@")
    end
  end
end