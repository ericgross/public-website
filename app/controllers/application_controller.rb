class ApplicationController < ActionController::Base
  def related_concepts(to:)
    return top_level_concepts unless to

    current_concept(to: to).references
  end

  def related_from_concepts(to:)
    return [] unless to

    current_concept(to: to).referenced_by
  end

  helper_method :related_concepts
  helper_method :related_from_concepts

  private

  def current_concept(to:)
    Concept::WithId.new.result(id: to)
  end
end
