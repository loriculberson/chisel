class ChunkIdentifier

  def identifier(chunk)
    if chunk.start_with?('#')
      "header"
    elsif chunk.start_with?('*') || chunk.match(/\A\d+\./)
      # chunk.match(/^\d+\./)
      "list"
    else
      "paragraph"
    end
  end
end