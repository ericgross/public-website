class Concepts
  def result
    stored_collections.map(&method(:object_from_hash))
  end

  private

  def object_from_hash(concept)
    OpenStruct.new(
      content: concept.fetch('content'),
      id: concept.fetch('_id'),
      referenced_by: referenced_by(concept),
      references: references(concept),
      title: concept.fetch('title')
    )
  end

  def referenced_by(concept)
    concepts_with_references.select { |cr| cr.fetch('references').map { |c| c.fetch('_id') }.include?(concept.fetch('_id')) }.map(&method(:object_from_hash))
  end

  def concepts_with_references
    stored_collections.reject { |c| c.fetch('references').empty? }
  end

  def references(concept)
    return [] if concept.fetch('references').empty?

    concept.fetch('references').map do |reference|
      OpenStruct.new(
        id: reference.fetch('_id'),
        title: reference.fetch('display')
      )
    end
  end

  def stored_collections
    JSON.parse(File.read('lib/cms_collections.json'))
  end
end
