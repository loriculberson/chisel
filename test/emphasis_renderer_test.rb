require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/emphasis_renderer'

class StrongRendererTest < Minitest::Test 

  def test_can_convert_one_asterisks_into_emphasis_tag_for_one_word

    emphasis_words = "*have*"
    
    e_renderer = EmphasisRenderer.new(emphasis_words)
    assert_equal "<em>have</em>", e_renderer.emphasis_format
  end

  def test_can_convert_one_asterisks_into_emphasis_tag_for_embedded_word

    emphasis_words = "You just *have* to try the cheesecake."
    
    e_renderer = EmphasisRenderer.new(emphasis_words)
    assert_equal "You just <em>have</em> to try the cheesecake.", e_renderer.emphasis_format
  end
end