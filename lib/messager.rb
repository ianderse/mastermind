#using output method instead of normal puts so that transition to GUI is easier

require 'colorize'

module Messager

  def self.output(string)
    string
  end

  def self.welcome
    "Welcome to MASTERMIND".colorize(:light_green)
  end

  def self.instructions
    "You will deduce a secret combinations of colors ("+"red".colorize(:red) +", "+"yellow".colorize(:yellow)+", "+"green".colorize(:green)+", or " + "blue".colorize(:blue)+").\nAfter each of guess, the computer will reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect.\nYou must then improve upon your previous guess to crack the code."
  end

  def self.goodbye
    "Thanks for playing."
  end

  def self.menu
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?".colorize(:light_blue)
  end

  def self.play
    "I have generated a beginner sequence with four elements made up of:".colorize(:cyan) + "\n(r)ed".colorize(:red)+ ", "+"(g)reen".colorize(:green) +", "+ "(b)lue".colorize(:blue) +", and " + "(y)ellow".colorize(:yellow)+". Use (q)uit at any time to end the game."
  end

end
