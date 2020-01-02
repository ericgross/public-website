class ConceptsController < ApplicationController
  def index; end

  def show; end

  delegate :title, to: :concept

  helper_method :title
  helper_method :concepts

  private

  def concept
    concepts.detect { |concept| concept.id == params.fetch(:id) }
  end

  def concepts
    stored_collections.map do |c|
      OpenStruct.new(
        title: c.fetch('title'),
        id: c.fetch('_id')
      )
    end
  end

  def stored_collections
    JSON.parse(File.read('lib/cms_collections.json'))
  end
end
