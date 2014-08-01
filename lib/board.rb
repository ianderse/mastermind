require_relative 'peg'
require_relative 'messager'

class Board

  include Messager

  attr_accessor :board, :win_check

  def initialize(requested_size=4, peg= nil)
    peg ||= randomized_peg

    @start_time = Time.now

    @board = []

    @guess_count = 0

    @win_check = false

    create_board(requested_size, peg)
  end

  def create_board(size, peg)
    size.times do
      @board << Peg.new(peg)
    end
  end

  def size
    @board.size
  end

  def randomized_peg
    ['r', 'y', 'b', 'g'].sample
  end

  def colors
    @board.map do |peg|
      peg.color
    end
  end

  def check_guess(guess)
    guess = CommandInterpreter.guess(guess)
    check = colors.zip(guess).map { |x, y| x == y }
    count = guess.count {|peg| colors.include?(peg) }

    if check.count(true) == @board.size
      @guess_count += 1
      @finish_time = Time.now

      puts Messager.output("Congratulations! You guessed the sequence '#{colors.join.upcase}' in #{@guess_count} guesses over #{print_time_minutes} minutes and #{print_time_seconds} seconds")
      @win_check = true
    else
      @guess_count += 1
      puts Messager.output("'#{guess.join.upcase}' has #{count} of the correct elements with #{check.count(true)} in the correct positions.")
    end

  end

  def print_time_minutes
    @finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
  end

  def print_time_seconds
    @finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
  end

end

if __FILE__ == $0
  require_relative 'command_interpreter'

  board = Board.new(4, 'r')

  guess = CommandInterpreter.guess('rrrr')

  board.check_guess(guess)

end
