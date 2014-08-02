#using output method instead of normal puts so that transition to GUI is easier

module Messager

  def self.output(string)
    string
  end

  def self.instructions
    "You will deduce a secret combinations of colors (red, yellow, green, or blue).\nAfter each of guess, the computer will reveal how many pegs are the correct color in the correct location, or the correct color in the incorrect location, or completely incorrect.\nYou must then improve upon your previous guess to crack the code."
  end

  def self.goodbye
    "Thanks for playing."
  end

  def self.menu
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

end
