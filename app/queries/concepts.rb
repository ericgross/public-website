class Concepts
  def result
    WithoutReferences.new.result.map { |concept| add_references(concept: concept) }
  end

  def add_references(concept:)
    concept.tap do |tapped_concept|
      tapped_concept.references = tapped_concept.references.map { |r| Concept::WithId.new.result(id: r.id) }
    end
  end
end
