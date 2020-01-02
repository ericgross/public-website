class ConceptsController < ApplicationController
  def index; end

  def concepts
    stored_collections.map { |c| OpenStruct.new(title: c.fetch('title')) }
  end
  helper_method :concepts

  private

  def stored_collections
    JSON.parse(File.read('lib/cms_collections.json'))
  end
end
