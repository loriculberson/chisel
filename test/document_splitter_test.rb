require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/document_splitter'

class DocumentSplitterTest < Minitest::Test 

  def test_document_can_be_converted_into_array
    document = <<DOCUMENT.chomp
# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
DOCUMENT
    chunk_array = [
      '# My Life in Desserts',
      '## Chapter 1: The Beginning',
      '"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'
    ]
    docu_split = DocumentSplitter.new(document)
    assert_equal chunk_array, docu_split.to_a
    
  end

end
