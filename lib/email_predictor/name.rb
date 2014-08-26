module EmailPredictor
  class Name

    attr_reader :full_name

    def initialize(full_name)
      @full_name = full_name
    end

    def initials
      @initials ||= extract_initials
    end


    def extract_initials 
      initials = []
      full_name.downcase.split(" ").each_with_object(initials) do |word, array|
        array << word[0]
      end
    end
  end
end