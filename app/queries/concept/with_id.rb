class Concept
  class WithId
    def result(id:)
      Concepts::WithoutReferences.new.result.detect { |concept| concept.id == id }
    end
  end
end
