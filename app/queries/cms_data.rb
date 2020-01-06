class CmsData
  def result
    stored_values.map(&method(:object_from_hash)).compact
  end

  private

  attr_reader :concepts

  def object_from_hash(concept_hash)
    return unless concept_hash.fetch('content')

    Concept::Bare.new(
      content: concept_hash.fetch('content'),
      id: concept_hash.fetch('_id'),
      references: concept_hash.fetch('references'),
      title: concept_hash.fetch('title')
    )
  end

  def stored_values
    JSON.parse(File.read(filename))
  end

  def filename
    return 'lib/cms_collections.json' unless Rails.env.test?

    'spec/fixtures/cms_collections.json'
  end
end
