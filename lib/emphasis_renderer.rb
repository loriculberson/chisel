class EmphasisRenderer
  attr_reader :emphasis_words

  def initialize(emphasis_words)
    @emphasis_words = emphasis_words
  end

  def emphasis_format
    emphasis_words.gsub(/\*(.+)\*/,'<em>\1</em>')
  end

  
end