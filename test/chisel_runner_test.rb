require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/chisel_runner'


class ChiselRunnerTest < Minitest::Test 

  def test_document_can_be_parsed_into_array

    document = '# My Life in Desserts

## Chapter 1: The Beginning'
   
    chisel_runner = ChiselRunner.new(document)
    assert chisel_runner.parse.is_a?(Array)
  end

  def test_parsed_document_can_be_identified_as_header
    document = '# My Life in Desserts'

    chisel_runner = ChiselRunner.new(document)
    expected_output = {"# My Life in Desserts"=>"header"}
    assert_equal expected_output, chisel_runner.identify
  end

#   def test_parsed_document_can_be_identified_as_header2
#     document = '## My Life in Desserts'

#     chisel_runner = ChiselRunner.new(document)
#     assert_equal "header", chisel_runner.identify
#   end

   def test_parsed_document_can_be_identified_as_paragraph
    document = '"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'

    chisel_runner = ChiselRunner.new(document)
    output = { document => "paragraph" }
    assert_equal output, chisel_runner.identify
  end

  def test_parsed_document_can_be_identified_as_a_numbered_list
    document = "1. Sushi\n2. Barbeque\n3. Mexican\n"

    chisel_runner = ChiselRunner.new(document)
    output = { document => "list"}
    assert_equal output, chisel_runner.identify
  end

  def test_document_can_be_converted_to_html_tags
   document = <<DOCUMENT
# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
DOCUMENT

    formatted_document = <<DOCUMENT
<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>

<p>"You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in <strong>Food &amp; Wine</strong> this place has been packed every night."</p>
DOCUMENT
  
    chisel_runner = ChiselRunner.new(document)
    assert_equal formatted_document, chisel_runner.format_document_to_html
    
  end

end

