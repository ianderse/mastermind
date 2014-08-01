gem 'minitest'
require 'minitest/autorun'
require './lib/command_interpreter'

class CommandTest < Minitest::Test

  include CommandInterpreter

  def test_it_properly_converts_a_single_item_string_to_an_array
    assert_equal ['r'], CommandInterpreter.guess('r')
  end

  def test_it_converts_a_multi_item_string_to_an_array
    assert_equal ['r', 'g', 'b', 'y'], CommandInterpreter.guess('rgby')
  end

  def test_it_converts_a_multi_item_string_to_an_array
    assert_equal ['r', 'r', 'r', 'r'], CommandInterpreter.guess('rrrr')
  end

  def test_it_sees_an_invalid_guess_with_a_one_letter_guess
    assert_equal "invalid guess", CommandInterpreter.guess('v')
  end

  def test_it_sees_a_partially_valid_guess_as_invalid
    assert_equal "invalid guess", CommandInterpreter.guess('rigg')
  end

  def test_it_recognizes_an_invalid_guess
    assert_equal "invalid guess", CommandInterpreter.guess('vioe')
  end

  def test_it_correctly_routes_menu_command_p
    skip
    assert_equal "What's your guess? ", CommandInterpreter.menu('p')
  end

end
