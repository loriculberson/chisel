require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/header_renderer'


class HeaderRendererTest < Minitest::Test 

  def test_can_convert_hashtag_into_h1_tag

    header = "# My Life in Desserts\n\n"
    
    h_renderer = HeaderRenderer.new(header)
    assert_equal "<h1> My Life in Desserts</h1>\n", h_renderer.header_format
  end

  def test_can_convert_two_hashtags_into_h2_tag

    header = "## My Life in Desserts\n\n"
    
    h_renderer = HeaderRenderer.new(header)
    assert_equal "<h2> My Life in Desserts</h2>\n", h_renderer.header_format
  end

  def test_can_convert_three_hashtags_into_h3_tag

    header = "### My Life in Desserts\n\n"
    
    h_renderer = HeaderRenderer.new(header)
    assert_equal "<h3> My Life in Desserts</h3>\n", h_renderer.header_format
  end

  def test_can_convert_four_hashtags_into_h4_tag

    header = "#### My Life in Desserts\n\n"
    
    h_renderer = HeaderRenderer.new(header)
    assert_equal "<h4> My Life in Desserts</h4>\n", h_renderer.header_format
  end

  def test_can_convert_five_hashtags_into_h4_tag

    header = "##### My Life in Desserts\n\n"
    
    h_renderer = HeaderRenderer.new(header)
    assert_equal "<h5> My Life in Desserts</h5>\n", h_renderer.header_format
  end
end