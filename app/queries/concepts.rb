class Concepts
  def result
    data_with_content.map do |c|
      OpenStruct.new(
        content: c.content,
        id: c.id,
        title: c.title,
        references: references(c),
        referenced_by: referenced_by(c)
      )
    end
  end

  private

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

    concept.references.select { |c| data_with_content.map(&:id).include?(c.fetch('_id')) }.map do |reference|
      OpenStruct.new(
        id: reference.fetch('_id'),
        title: reference.fetch('display')
      )
    end
  end
end
