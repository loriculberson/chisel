class ChunkIdentifier
  attr_reader :chunk

  def initialize(chunk)
    @chunk = chunk
  end

  def identifier
    if chunk.start_with?('#')
       "header"
    elsif chunk.start_with?('*') || chunk.match(/^\d+\./)
      "list"
    else
      "paragraph"
    end
  end
end