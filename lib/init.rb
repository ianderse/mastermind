require 'gosu'

class GameWindow < Gosu::Window

  def initialize width=800, height=600, fullscreen=false
    super
    self.caption = "Mastermind"
  end

end

window = GameWindow.new
window.show
