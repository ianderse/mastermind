gem 'minitest'
require 'minitest/autorun'
require './lib/board'

class BoardTest < Minitest::Test

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

  def test_it_can_recognize_a_fully_correct_guess

  end

  def test_it_correctly_recognizes_a_partial_correct_guess

  end

  def test_it_can_display_the_board
    skip
    requested_size = 4

    board = Board.new(requested_size)

    assert_equal "test", board.colors
  end

end
