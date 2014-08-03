require 'gosu'
require_relative 'board'
require_relative 'messager'

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
    Messager.welcome(self)
  end

  def button_up(key)

    case key
    when Gosu::Button::KbEscape
      self.close
    #when Gosu::Button::
    end
  end

end

window = GameWindow.new
window.show
