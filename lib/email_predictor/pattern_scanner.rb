module EmailPredictor
  class PatternScanner

    attr_accessor :email, :name 

    def initialize(args)
      @name  = args[:name]
      @email = args[:email]
    end

    def predicted_pattern
      case
      when first_name_dot_last_name?
        :first_name_dot_last_name
      when first_name_dot_last_initial?
        :first_name_dot_last_initial
      when first_initial_dot_last_name?
        :first_initial_dot_last_name
      when first_initial_dot_last_initial?
        :first_initial_dot_last_initial
      end 
    end

    private

    def first_name_dot_last_name?
      first_is_name? && last_is_name?
    end

    def first_name_dot_last_initial?
      first_is_name? && last_is_initial?
    end

    def first_initial_dot_last_name?
      first_is_initial? && last_is_name?
    end

    def first_initial_dot_last_initial?
      email.local.split('.') == name.initials
    end

    def last_is_initial?
      email.local.split(".").last == name.initials.last
    end

    def first_is_name?
      email.first_local == name.first
    end

    def first_is_initial?
      email.first_local == name.initials.first
    end

    def last_is_name?
      email.local.split('.').last == name.last
    end
  end
end