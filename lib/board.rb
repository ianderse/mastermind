require_relative 'peg'

class Board

  attr_reader :board

  def initialize(requested_size)
    @requested_size = requested_size
    @board = []

    create_board(@requested_size)
  end

  def create_board(size)
    size.times do
      @board << Peg.new(randomized_peg)
    end
  end

  def size
    @board.size
  end

  def randomized_peg
    ['r', 'y', 'b', 'g'].sample
  end

  def colors
    @board.map do |peg|
      peg.color
    end
  end

end
