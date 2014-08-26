module EmailPredictor
  class Name

    attr_reader :full_name

    def initialize(full_name)
      @full_name = full_name
    end

    def initials
      @initials ||= extract_initials
    end

    def first
      @first ||= extract_first
    end

    def last
      @last ||= extract_last
    end

    def to_a
      [first, last]
    end

    private

    def extract_initials 
      full_name.downcase.split(" ").each_with_object([]) do |word, array|
        array << word[0]
      end
    end

    def extract_last
      full_name.downcase.split(" ").last
    end

    def extract_first
      full_name.downcase.split(" ").first
    end
  end
end