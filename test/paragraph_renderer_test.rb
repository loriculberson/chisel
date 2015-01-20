require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/paragraph_renderer'


class ParagraphRendererTest < Minitest::Test 

  def test_can_convert_asterisk_to_emphasis_tag
    
    paragraph = "You just *have* to try the cheesecake!"
    p_renderer = ParagraphRenderer.new(paragraph)
    assert_equal "<p>You just <em>have</em> to try the cheesecake!</p>", p_renderer.word_format
  end

  def test_can_convert_two_asterisks_to_strong_tag

    paragraph = "You just have to try the **cheesecake!**"
    p_renderer = ParagraphRenderer.new(paragraph)
    assert_equal "<p>You just have to try the <strong>cheesecake!</strong></p>", p_renderer.word_format
  end

  def test_can_convert_to_emphasis_and_strong_tag

    paragraph = "You just *have* to try the **cheesecake!**"
    p_renderer = ParagraphRenderer.new(paragraph)
    formatted_text = "<p>You just <em>have</em> to try the <strong>cheesecake!</strong></p>"
    assert_equal formatted_text, p_renderer.word_format
  end

  def test_can_convert_an_ampersand_to_html

    paragraph = <<DOCUMENT.chomp
"Ever since it appeared in **Food & Wine** this place has been packed every night."
DOCUMENT
    
    formatted_text = '<p>"Ever since it appeared in <strong>Food &amp; Wine</strong> this place has been packed every night."</p>'
    p_renderer = ParagraphRenderer.new(paragraph)
    assert_equal formatted_text, p_renderer.word_format
  end

  def test_can_convert_chunk_of_text_to_paragraph_tags
  
    paragraph = <<DOCUMENT.chomp
"You just *have* to try the cheesecake," he said. "Ever since it appeared in **Food & Wine** this place has been packed every night."
DOCUMENT

   formatted_text = '<p>"You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in <strong>Food &amp; Wine</strong> this place has been packed every night."</p>'

    p_renderer = ParagraphRenderer.new(paragraph)
    assert_equal formatted_text, p_renderer.word_format
  end

end
