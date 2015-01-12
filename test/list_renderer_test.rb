require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/list_renderer'


class ListRendererTest < Minitest::Test 

  def test_can_convert_asterisks_into_bullet_point

    list = "*Sushi\n*Barbeque\n*Mexican\n"
    
    l_renderer = ListRenderer.new(list)
    bulleted_list = 
'<ul>
<li>Sushi</li>
<li>Barbeque</li>
<li>Mexican</li>
</ul>'

    assert_equal bulleted_list, l_renderer.list_format
  end

end