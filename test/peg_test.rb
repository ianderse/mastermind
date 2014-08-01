gem 'minitest'
require 'minitest/autorun'
require './lib/peg'

class PegTest < Minitest::Test

  def test_it_can_create_a_red_peg

    red_peg = Peg.new("r")
    assert_equal "r", red_peg.color

  end

  def test_it_can_create_a_yellow_peg

    yellow_peg = Peg.new("y")
    assert_equal "y", yellow_peg.color

  end

  def test_it_can_create_a_blue_peg

    blue_peg = Peg.new("b")
    assert_equal "b", blue_peg.color

  end

  def test_it_can_create_a_green_peg

    green_peg = Peg.new("g")
    assert_equal "g", green_peg.color

  end

end
