require_relative 'messager'
require_relative 'board'

module CommandInterpreter

  def self.guess(guess)
    valid_letters = 'rgby'

    guess.downcase.split(//).each do |letter|
      if valid_letters.include?(letter)
        letter
      else
        return "invalid guess"
        break
      end
    end
  end

  def self.menu(choice)
    if choice == 'p' || choice == 'play'
      'p'
    end
  end
end
