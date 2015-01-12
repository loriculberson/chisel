class HeaderRenderer
  attr_reader :header

  def initialize(header)
    @header = header
  end

  def header_format
    header.gsub(/\#####(.+)\n/,'<h5>\1</h5>').gsub(/\####(.+)\n/,'<h4>\1</h4>').gsub(/\###(.+)\n/,'<h3>\1</h3>').gsub(/\##(.+)\n/,'<h2>\1</h2>').gsub(/\#(.+)\n/,'<h1>\1</h1>')
  end
end

