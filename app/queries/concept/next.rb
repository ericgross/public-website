module Concept
  class Next
    def result(from:)
      @from = from

      return first_reference if first_reference

      from.referenced_by.first.references.second
    end

    private

    def first_reference
      from.references.first
    end

    attr_reader :from
  end
end
