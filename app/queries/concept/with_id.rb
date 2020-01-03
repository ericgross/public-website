module Concept
  class WithId
    def result(id:)
      Concepts.new.result.detect { |concept| concept.id == id }
    end
  end
end
