require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/strong_renderer'


class StrongRendererTest < Minitest::Test 

  def test_can_convert_two_asterisks_into_strong_tag

    strong_words = "**Food and Wine**"
    
    s_renderer = StrongRenderer.new(strong_words)
    assert_equal "<strong>Food and Wine</strong>", s_renderer.strong_format
  end

  def test_can_convert_two_asterisks_and_ampersand_into_strong_tag

    strong_words = "**Food & Wine**"
    
    s_renderer = StrongRenderer.new(strong_words)
    assert_equal "<strong>Food &amp; Wine</strong>", s_renderer.strong_format
  end

end