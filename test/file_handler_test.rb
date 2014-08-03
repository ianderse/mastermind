gem 'minitest'
require 'minitest/autorun'
require './lib/file_handler'

class FileHandlerTest < Minitest::Test

  def test_it_can_save_data
    hash = {
      "key_a" => "val_a",
      "key_b" => "val_b"
    }

    FileHandler.save_to_file(hash)

  end

  def test_it_can_retrieve_high_scores
    parsed_data = JSON.parse( IO.read('./data/high_scores.json') )

    assert_equal parsed_data, FileHandler.parse_high_scores
  end

  def test_it_can_print_high_scores_in_order
    
  end

end
