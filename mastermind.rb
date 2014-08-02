gem 'colorize'
require_relative 'lib/messager'
require_relative 'lib/command_interpreter'

class Mastermind
  def initialize
    menu
  end

  def menu
    puts Messager.output("Welcome to MASTERMIND")
    puts Messager.menu
    @choice = CommandInterpreter.menu(gets.chomp)

    if @choice == 'p'
      play
    elsif @choice == 'i'
      puts Messager.instructions
      menu
    else
      puts Messager.goodbye
      exit
    end

  end

  def play
    board = Board.new

    puts Messager.output("I have generated a beginner sequence with four elements made up of:")
    puts Messager.output("(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.")

    while board.win_check == false
      puts Messager.output("What's your guess? ")
      g_choice = CommandInterpreter.guess(gets.chomp)
      if g_choice == 'q' || g_choice == 'quit'
        puts Messager.goodbye
        exit
      elsif g_choice == "invalid guess"
        puts Messager.output("Invalid guess")
      else
        board.check_guess(g_choice)
      end
    end

    puts Messager.output("Do you want to (p)lay again or (q)uit? ")
    choice = CommandInterpreter.menu(gets.chomp)
    if choice == 'p'
      play
    else
      puts Messager.goodbye
      exit
    end
  end

end




new_game = Mastermind.new

new_game
