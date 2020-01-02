class ConceptsController < ApplicationController
  def index; end

  def show; end

  delegate :content, to: :concept
  delegate :referenced_by, to: :concept
  delegate :references, to: :concept
  delegate :title, to: :concept

  helper_method :concepts
  helper_method :content
  helper_method :referenced_by
  helper_method :references
  helper_method :title

  private

  def concept
    concepts.detect { |concept| concept.id == params.fetch(:id) }
  end

  def concepts
    Concepts.new.result
  end
end
