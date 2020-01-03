class CmsData
  def result
    stored_values.map(&method(:object_from_hash))
  end

  private

  def object_from_hash(concept)
    OpenStruct.new(
      content: concept.fetch('content'),
      id: concept.fetch('_id'),
      references: concept.fetch('references'),
      title: concept.fetch('title')
    )
  end

  def stored_values
    JSON.parse(File.read('lib/cms_collections.json'))
  end
end
