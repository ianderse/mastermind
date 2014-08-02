gem 'minitest'
require 'minitest/autorun'
require './lib/messager'

class MessagerTest < Minitest::Test

  include Messager

  def test_it_can_receive_messages
    assert_equal "test", Messager.output("test")
  end

  def test_it_can_say_goodbye
    assert_equal "Thanks for playing.", Messager.goodbye
  end

  def test_it_can_give_instructions
    assert_equal "You will deduce a secret combinations of colors (red, yellow, green, or blue).\nAfter each of guess, the computer will reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect.\nYou must then improve upon your previous guess to crack the code.", Messager.instructions
  end

  def test_it_can_print_menu
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Messager.menu
  end


end
