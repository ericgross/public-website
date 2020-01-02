class Concepts
  def result
    stored_collections.map do |concept|
      OpenStruct.new(
        content: concept.fetch('content'),
        id: concept.fetch('_id'),
        references: references(concept),
        title: concept.fetch('title')
      )
    end
  end

  def stored_collections
    JSON.parse(File.read('lib/cms_collections.json'))
  end

  private

  def references(concept)
    return [] if concept.fetch('references').empty?

    concept.fetch('references').map do |reference|
      OpenStruct.new(
        id: reference.fetch('_id'),
        title: reference.fetch('display')
      )
    end
  end
end
