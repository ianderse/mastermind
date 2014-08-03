#set up as individual peg instead of sequence so that transitiion to GUI is easier

class Peg

  attr_reader :color
  attr_accessor :x, :y

  def initialize(window, color = ['r', 'y', 'b', 'g'].sample)
    @color = color
    if color == 'r'
      @image = Gosu::Image.new(window, './data/red_circle.png', false)
    elsif color == 'y'
      @image = Gosu::Image.new(window, './data/yellow_circle.png', false)
    elsif color == 'b'
      @image = Gosu::Image.new(window, './data/blue_circle.png', false)
    else
      @image = Gosu::Image.new(window, './data/green_circle.png', false)
    end
  end

  def draw
    @image.draw(@x, @y, 1)
  end

end
