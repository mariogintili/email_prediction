module EmailPredictor
  class Name

    attr_reader :full_name

    def initialize(full_name)
      @full_name = full_name
    end

    def initials
      @initials ||= full_name.downcase.split(" ").map { |word| word[0] }
    end

    def first
      @first ||= full_name.downcase.split(" ").first
    end

    def last
      @last ||= full_name.downcase.split(" ").last
    end

    def to_a
      full_name.downcase.split(" ")
    end
  end
end