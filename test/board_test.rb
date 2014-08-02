gem 'minitest'
require 'minitest/autorun'
require './lib/board'
require './lib/messager'
require './lib/command_interpreter'

class BoardTest < Minitest::Test

  include CommandInterpreter

  #skipped tests are obsolte after refactoring

  def test_it_can_create_a_board_of_one_peg

    board = Board.new(1)

    assert_equal 1, board.size

  end

  def test_it_can_create_an_array_of_multiple_pegs

    board = Board.new

    assert_equal 4, board.size

  end

  def test_it_can_recognize_a_fully_correct_guess_with_single_item
    #mock test here after refactor?
    skip

    guess = CommandInterpreter.guess('r')

    board = Board.new(1)

    assert_equal "Congratulations! You guessed the sequence 'R' in 1 guesses over 0 minutes and 0 seconds" , board.check_guess(guess)

  end

  def test_it_can_recognize_a_correct_guess_with_multiple_items
    skip
    #mock test here after refactor?
    guess = CommandInterpreter.guess('rrrr')

    board = Board.new

    assert_equal "Congratulations! You guessed the sequence 'RRRR' in 1 guesses over 0 minutes and 0 seconds", board.check_guess(guess)
  end

  def test_it_correctly_recognizes_a_partial_correct_guess
    #mock test here after refactor?
    skip
    guess = CommandInterpreter.guess('rgrb')

    board = Board.new

    assert_equal "'RGRB' has 2 of the correct elements with 2 in the correct positions.", board.check_guess(guess)
  end

  def test_it_correctly_recognizes_correct_positional_guesses
    #mock test here after refactor?
    skip
    guess = CommandInterpreter.guess('rgrb')

    board = Board.new

    board.board = [Peg.new('r'), Peg.new('b'), Peg.new('b'), Peg.new('r') ]

    assert_equal "'RGRB' has 3 of the correct elements with 1 in the correct positions.", board.check_guess(guess)
  end

  def test_it_can_display_the_board
    skip
    #mock test here after refactor?
    requested_size = 4

    board = Board.new(requested_size)

    assert_equal "test", board.colors
  end

  def test_it_can_check_win
    skip
    #mock test here after refactor?
    board = Board.new

    board.check = [true, true, true, true]

    assert_equal true, board.win?
  end

  def test_it_can_count_guesses
    board = Board.new

    board.check_guess(CommandInterpreter.guess('rrrr'))
    board.check_guess(CommandInterpreter.guess('rrrr'))
    board.check_guess(CommandInterpreter.guess('rrrr'))

    board.guess_count == 3

  end

end
