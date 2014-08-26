module EmailPredictor
  class Prediction

    attr_reader :name, :domain

    def initialize(name, domain)
      @name   = name
      @domain = domain 
    end

    def first_name_dot_last_name
      address = [name.downcase.gsub(' ', '.'), domain].join("@")
      @first_name_dot_last_name ||= Email.new address
    end

    def first_name_dot_last_initial
      index   = name.rindex(' ') + 1
      address = [name[0..index].downcase.gsub(' ', '.'), domain].join("@")
      @first_name_dot_last_initial ||= Email.new address
    end
  end
end