gem 'minitest'
require 'minitest/autorun'
require './lib/board'
require './lib/messager'
require './lib/command_interpreter'

class BoardTest < Minitest::Test

  # include Messager
  include CommandInterpreter

  def test_it_can_create_an_array_of_one_peg

    requested_size = 1

    board = Board.new(requested_size)

    assert_equal 1, board.size

  end

  def test_it_can_create_an_array_of_multiple_pegs

    requested_size = 4

    board = Board.new(requested_size)

    assert_equal 4, board.size

  end

  def test_it_randomizes_peg_colors
    skip

    board = Board.new(1)

    assert_equal ['r', 'y', 'b', 'g'].sample, board.randomized_peg

  end

  def test_it_can_recognize_a_fully_correct_guess_with_single_item
    guess = CommandInterpreter.guess('r')

    board = Board.new(1, 'r')

    assert_equal "Congratulations! You guessed the sequence 'R' in 1 guesses over 0 minutes and 0 seconds" , board.check_guess(guess)

  end

  def test_it_can_recognize_a_correct_guess_with_multiple_items
    guess = CommandInterpreter.guess('rrrr')

    board = Board.new(4, 'r')

    assert_equal "Congratulations! You guessed the sequence 'RRRR' in 1 guesses over 0 minutes and 0 seconds", board.check_guess(guess)
  end

  def test_it_correctly_recognizes_a_partial_correct_guess
    guess = CommandInterpreter.guess('rgrb')

    board = Board.new(4, 'r')

    assert_equal "'RGRB' has 2 of the correct elements with 2 in the correct positions.", board.check_guess(guess)
  end

  def test_it_correctly_recognizes_correct_positional_guesses
    guess = CommandInterpreter.guess('rgrb')

    board = Board.new(4)

    board.board = [Peg.new('r'), Peg.new('b'), Peg.new('b'), Peg.new('r') ]

    assert_equal "'RGRB' has 3 of the correct elements with 1 in the correct positions.", board.check_guess(guess)
  end

  def test_it_can_display_the_board
    skip
    requested_size = 4

    board = Board.new(requested_size)

    assert_equal "test", board.colors
  end

end
