class Concept
  def initialize(content:, id:, references:, title:, referenced_by:)
    @content = content
    @id = id
    @references = references
    @referenced_by = referenced_by
    @title = title
  end

  attr_reader :content
  attr_reader :id
  attr_reader :referenced_by
  attr_accessor :references
  attr_reader :title
end
