class StrongRenderer
  attr_reader :strong_words

  def initialize(strong_words)
    @strong_words = strong_words
  end

  def strong_format
    strong_words.gsub(/\*\*(.+)\*\*/,'<strong>\1</strong>').gsub(/\&/,'&amp;')
  end

end