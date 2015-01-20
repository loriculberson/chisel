class ParagraphRenderer
  attr_reader :paragraph

  def initialize(paragraph)
    @paragraph = paragraph
  end

  def word_format
    stronged = format_strong(paragraph)
    emphasised = format_emphasis(stronged)
    ampersanded = format_ampersand(emphasised)
    format_paragraph(ampersanded)
  end

private
  def format_strong(paragraph)
    paragraph.gsub(/\*\*(.+)\*\*/,'<strong>\1</strong>')
  end

  def format_emphasis(paragraph)
    paragraph.gsub(/\*(.+)\*/,'<em>\1</em>')
  end

  def format_ampersand(paragraph)
    paragraph.gsub(/\&/,'&amp;')
  end

  def format_paragraph(paragraph)
    "<p>" + paragraph + "</p>"
  end


end




=begin
class ParagraphRenderer
  attr_reader :paragraph

  def initialize(paragraph)
    @paragraph = paragraph.dup
       #paragraph in this instance is the paragraph from the initialized method
  end

  def word_format     #adding the ! changes the para
    format_strong!
    format_emphasis!
    format_ampersand!
    format_paragraph!
    paragraph
  end

  def format_strong!   #using gsub! changes the paragraph in place instead of creating a new one.
    paragraph.gsub!(/\*\*(.+)\*\*/,'<strong>\1</strong>')
  end

  def format_emphasis!
    paragraph.gsub!(/\*(.+)\*/,'<em>\1</em>')
  end

  def format_ampersand!
    paragraph.gsub!(/\&/,'&amp;')
  end

  def format_paragraph!
    @paragraph = "<p>" + paragraph + "</p>"
  end


end
=end