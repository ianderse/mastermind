#set up as individual peg instead of sequence so that transitiion to GUI is easier

class Peg

  attr_reader :color

  def initialize(color = ['r', 'y', 'b', 'g'].sample)
    @color = color
  end

end
