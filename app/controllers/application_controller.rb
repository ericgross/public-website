class ApplicationController < ActionController::Base
  def related_concepts(to:)
    return top_level_concepts unless current_concept(to: to)

    current_concept(to: to).references
  end

  helper_method :related_concepts

  private

  def current_concept(to)
    Concept::WithId.new.result(id: to)
  end
end
