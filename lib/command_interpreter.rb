require_relative 'messager'
require_relative 'board'

module CommandInterpreter

  def self.guess(guess, num_pegs = 4)

    if quit?(guess)
      'q'
    else
      split_guess(guess, num_pegs)
    end

  end

  def self.difficulty(choice)
    if choice == 'b' || choice == 'beginner' || choice == 'B'
      'b'
    elsif choice == 'i' || choice == 'intermediate' || choice == 'I'
      'i'
    elsif choice == 'a' || choice == 'advanced' || choice == 'A'
      'a'
    elsif quit?(choice)
      'q'
    else
      'invalid choice'
    end
  end

  def self.split_guess(guess, num_pegs)
    if num_pegs == 4
      valid_letters = 'rgby'
    elsif num_pegs == 6
      valid_letters = 'rgbyc'
    elsif num_pegs == 8
      valid_letters = 'rgbycp'
    end

    guess.downcase.split(//).find_all do |letter|
      if valid_letters.include?(letter)
        letter
      else
        return "invalid guess"
      end
    end

  end

  def self.menu(choice)
    if choice == 'p' || choice == 'play' || choice == 'P'
      'p'
    elsif choice == 'i' || choice == 'instructions' || choice == 'I'
      'i'
    elsif self.quit?(choice)
      'q'
    end
  end

  def self.quit?(input)
    input == 'q' || input == 'quit' || input == 'Q'
  end
end
