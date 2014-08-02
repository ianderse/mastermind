#set up as individual peg instead of sequence so that transitiion to GUI is easier

class Peg

  attr_reader :color

  def initialize
    @color = randomized_peg
  end

  def randomized_peg
    ['r', 'y', 'b', 'g'].sample
  end
end
