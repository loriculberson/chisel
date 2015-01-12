class ListRenderer
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def list_format
    "<ul>\n" + list.gsub(/\*(.+)/,'<li>\1</li>') + "</ul>"
  end
end