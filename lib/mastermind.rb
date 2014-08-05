require_relative 'messager'
require_relative 'command_interpreter'

#extensions:
#ability to use bundle install for required gems
#colorize
#three difficulty levels

class Mastermind
  def initialize
    system "clear"
  end

  def menu
    puts Messager.welcome
    puts Messager.menu

    choice = CommandInterpreter.menu(gets.strip)

    if choice == 'p'
      difficulty
    elsif choice == 'i'
      puts Messager.instructions
      menu
    elsif choice == 'q'
      quit
    else
      puts Messager.invalid
    end

  end

  def difficulty
    puts Messager.difficulty
    choice = CommandInterpreter.difficulty(gets.strip)

    if choice == 'invalid choice'
      puts Messager.invalid
    elsif choice == 'q'
      quit
    elsif choice == 'b'
      difficulty_level = 'begginer'
      num_pegs = 4
    elsif choice == 'i'
      difficulty_level = 'intermediate'
      num_pegs = 6
    elsif choice == 'a'
      difficulty_level = 'advanced'
      num_pegs = 8
    end

    play(difficulty_level, num_pegs)

  end

  def play(difficulty_level, num_pegs)
    board = Board.new(num_pegs)

    puts Messager.play(difficulty_level, num_pegs)

    while !board.win_check
      puts Messager.output("What's your guess? ")
      g_choice = CommandInterpreter.guess(gets.strip, num_pegs)
      if g_choice == 'q'
        quit
      elsif g_choice.size > board.size || g_choice.size < board.size
        puts Messager.invalid
      else
        board.check_guess(g_choice)
      end
    end

    play_again

  end

  def play_again
    puts Messager.output("Do you want to (p)lay again or (q)uit? ")

    choice = CommandInterpreter.menu(gets.strip)
    if choice == 'p'
      menu
    else
      quit
    end
  end

  def quit
    puts Messager.goodbye
    exit
  end

end

new_game = Mastermind.new

new_game
