module EmailPredictor
  class Prediction

    attr_reader :name, :domain

    def initialize(full_name, full_domain)
      @name   = Name.new full_name
      @domain = Domain.new full_domain
    end

    def predicted_email
      email_factory.build(name: name, domain: domain, pattern: predicted_pattern)
    end

    private

    def dataset
      @dataset ||= DataSet.new
    end

    def email_factory
      @email_factory ||= EmailFactory.new 
    end

    def matched_emails
      dataset.emails.select do |email|
        domain.full_domain == email.domain
      end
    end

    def matched_patterns
      all_patterns = matched_emails.group_by(&:pattern)
      all_patterns.each do |key, value|
        all_patterns[key] = value.length 
      end
    end

    def predicted_pattern
      if matched_patterns.any?
        matched_patterns.max_by {|_, val| val }.first
      end
    end

    def matched_locals
      matched_emails.map(&:local)
    end
  end
end