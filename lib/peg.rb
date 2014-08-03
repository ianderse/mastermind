#set up as individual peg instead of sequence so that transitiion to GUI is easier

class Peg

  attr_reader :color

  def initialize(num_pegs=4)
    @color = randomized_color(num_pegs)
  end

  def randomized_color(num_pegs)
    if num_pegs == 4
      ['r', 'y', 'b', 'g'].sample
    elsif num_pegs == 6
      ['r', 'y', 'b', 'g', 'c'].sample
    elsif num_pegs == 8
      ['r', 'y', 'b', 'g', 'c', 'p'].sample
    end
  end
end
