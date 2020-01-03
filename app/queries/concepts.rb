class Concepts
  def result
    data_with_content.map(&method(:object_from_data))
  end

  private

  def object_from_data(concept)
    OpenStruct.new(
      content: concept.content,
      id: concept.id,
      title: concept.title,
      references: references(concept),
      referenced_by: referenced_by(concept)
    )
  end

  def referenced_by(concept)
    concepts_with_references.select { |cr| cr.references.map { |c| c.fetch('_id') }.include?(concept.id) }
  end

  def concepts_with_references
    data_with_content.reject { |c| c.references.empty? }
  end

  def data_with_content
    CmsData.new.result.reject { |concept| concept.content.empty? }
  end

  def references(concept)
    return [] if concept.references.empty?

    existing_references = concept.references.select { |c| data_with_content.map(&:id).include?(c.fetch('_id')) }
    existing_references.map(&method(:object_from_reference))
  end

  def object_from_reference(reference)
    OpenStruct.new(
      id: reference.fetch('_id'),
      title: reference.fetch('display')
    )
  end
end
