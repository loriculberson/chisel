class ParagraphRenderer
  attr_reader :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def word_format
    paragraph.gsub(/\*\*(.+)\*\*/,'<strong>\1</strong>').gsub(/\*(.+)\*/,'<em>\1</em>').gsub(/\&/,'&amp;').gsub(/\n(.+)\n/,'<p>\1</p>')
  end
end