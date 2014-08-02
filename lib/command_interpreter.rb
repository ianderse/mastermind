require_relative 'messager'
require_relative 'board'

module CommandInterpreter

  def self.guess(guess)

    if guess == 'q' || guess == 'quit'
      'q'
    elsif guess.size > 4 || guess.size < 4
      return "invalid guess"
    else
      split_guess(guess)
    end

  end

  def self.split_guess(guess)
    valid_letters = 'rgby'

    guess.downcase.split(//).find_all do |letter|
      if valid_letters.include?(letter)
        letter
      else
        return "invalid guess"
      end
    end

  end

  def self.menu(choice)
    if choice == 'p' || choice == 'play'
      'p'
    elsif choice == 'i' || choice == 'instructions'
      'i'
    elsif choice == 'q' || choice == 'quit'
      'q'
    end
  end
end
