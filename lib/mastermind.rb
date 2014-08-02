require_relative 'messager'
require_relative 'command_interpreter'

class Mastermind
  def initialize
    system "clear"
    menu
  end

  def menu
    puts Messager.welcome
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

    puts Messager.play

    while !board.win_check
      puts Messager.output("What's your guess? ")
      g_choice = CommandInterpreter.guess(gets.chomp)
      if g_choice == 'q'
        puts Messager.goodbye
        exit
      elsif g_choice == "invalid guess"
        puts Messager.output("Invalid guess")
      else
        board.check_guess(g_choice)
      end
    end

    play_again

  end

  def play_again
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
