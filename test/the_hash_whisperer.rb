require "minitest/autorun"
require_relative "../lib/the_hash_whisperer"

class TheHashWhispererTest < Minitest::Test
  def test_open_file
    json = get_file_as_string(File.join(File.dirname(__FILE__), './fixtures/hello.json'))
    assert_equal "\"hello world\"", json
  end

  def test_blind_grabbing
    json = get_file_as_string(File.join(File.dirname(__FILE__), './fixtures/the_cat_api.json'))
    whisperer = TheHashWhisperer.new
    values = whisperer.find_all_values_for('id', JSON.parse(json))
    assert_equal(values.first, "3h0")
    assert_equal(values.last, "xoI_EpOKe")
  end

  def test_shallow_surgical_grabbing
    json = get_file_as_string(File.join(File.dirname(__FILE__), './fixtures/enderbook_ugc.json'))
    whisperer = TheHashWhisperer.new
    values = whisperer.drill_into_and_find('data.archives.data.generic_data.updated_at', json, true)
    assert_equal(values.first, "2022-06-19T22:49:06.453Z")
  end

  def test_deep_surgical_grabbing
    json = get_file_as_string(File.join(File.dirname(__FILE__), './fixtures/enderbook_ugc.json'))
    whisperer = TheHashWhisperer.new
    values = whisperer.drill_into_and_find('data.archives.data.generic_data.server.updated_at', json, true)
    assert_equal(values.first, "2022-06-19T22:49:06.416Z")
  end
  
  def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line do |line|
      data += line
    end
    return data
  end
end
