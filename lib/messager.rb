#using output method instead of normal puts so that transition to GUI is easier

require 'colorize'

module Messager

  def self.output(string)
    string
  end

  def self.invalid
    'invalid choice'
  end

  def self.welcome
    "Welcome to MASTERMIND".colorize(:light_green)
  end

  def self.instructions
    "You will deduce a secret combinations of colors.\nAfter each of guess, the computer will reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect.\nYou must then improve upon your previous guess to crack the code."
  end

  def self.difficulty
    "What difficulty would you like to play at?" + " (B)eginner [4 pegs]".colorize(:light_green) + ", " + " (I)ntermediate [6 pegs]".colorize(:cyan) + ", " + " (A)dvanced [8 pegs]".colorize(:red)
  end

  def self.goodbye
    "Thanks for playing."
  end

  def self.menu
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?".colorize(:light_blue)
  end

  def self.play(difficulty, num_pegs)
    added_colors = ""
    if num_pegs == 6
      added_colors = ", and (c)yan".colorize(:cyan)
    elsif num_pegs == 8
      added_colors = ", (c)yan, ".colorize(:cyan) + "and " + "(p)urple".colorize(:magenta)
    end
    "I have generated a #{difficulty} sequence with #{num_pegs} elements made up of:".colorize(:cyan) + "\n(r)ed".colorize(:red)+ ", "+"(g)reen".colorize(:green) +", "+ "(b)lue".colorize(:blue) +", " + "(y)ellow".colorize(:yellow) + added_colors + ". Use (q)uit at any time to end the game."
  end

end
