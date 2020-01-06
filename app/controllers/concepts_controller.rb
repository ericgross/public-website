class ConceptsController < ApplicationController
  def index; end

  def show; end

  delegate :content, to: :concept
  delegate :referenced_by, to: :concept
  delegate :references, to: :concept
  delegate :title, to: :concept

  helper_method :concepts
  helper_method :content
  helper_method :next_concept
  helper_method :referenced_by
  helper_method :references
  helper_method :title
  helper_method :top_level_concepts

  private

  def top_level_concepts
    concepts.select { |concept| concept.referenced_by.empty? }
  end

  def concept
    concepts.detect { |concept| concept.id == concept_id }.tap do |current_concept|
      raise "Concept not found: #{concept_id}" unless current_concept
    end
  end

  def concept_id
    params.fetch(:id)
  end

  def concepts
    Concepts.new.result
  end

  def next_concept
    Concept::Next.new.result(from: concept)
  end
end
