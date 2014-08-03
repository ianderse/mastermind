require_relative 'messager'
require_relative 'board'

module CommandInterpreter

  def self.guess(guess)

    if quit?(guess)
      'q'
    else
      split_guess(guess)
    end

  end

  def self.difficulty(choice)
    if choice == 'b' || choice == 'beginner'
      'b'
    elsif choice == 'i' || choice == 'intermediate'
      'i'
    elsif choice == 'a' || choice == 'advanced'
      'a'
    else
      'invalid choice'
    end
  end

  def self.invalid
    'invalid choice'
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
    elsif self.quit?(choice)
      'q'
    end
  end

  def self.quit?(input)
    input == 'q' || input == 'quit'
  end
end
