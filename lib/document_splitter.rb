class DocumentSplitter
  attr_reader :doc

  def initialize(doc)
    @doc = doc
  end

  def to_a
    doc.split("\n\n")
  end

end