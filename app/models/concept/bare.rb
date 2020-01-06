class Concept
  class Bare
    def initialize(content:, id:, references:, title:)
      @content = content
      @id = id
      @references = references
      @title = title
    end

    attr_reader :content
    attr_reader :id
    attr_reader :references
    attr_reader :title
  end
end
