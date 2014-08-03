require 'gosu'
require_relative 'board'

class GameWindow < Gosu::Window

  def initialize width=600, height=480, fullscreen=false
    super
    self.caption = "Mastermind"

    @new_game = Board.new(self)
  end

  def update

  end

  def draw
    @new_game.draw


  end

  def button_up(key)
    self.close if key == Gosu::KbEscape
  end

end

window = GameWindow.new
window.show
