require_relative 'peg'
require_relative 'messager'

class Board

  include Messager

  attr_reader :board, :win_check #, :guess_count #only necessary for tests

  def initialize(requested_size=4)

    @start_time = Time.now
    @board = []
    @guess_count = 0
    @win_check = false

    create_board(requested_size)
  end

  def create_board(size)
    size.times do
      @board << Peg.new
    end
  end

  def size
    @board.size
  end

  def colors
    @board.map do |peg|
      peg.color
    end
  end

  def check_guess(guess)
    @guess = guess

    if win?
      @guess_count += 1
      @finish_time = Time.now

      puts Messager.output("Congratulations! You guessed the sequence '#{colors.color_array.join.upcase}' in #{@guess_count} guesses over #{print_time_minutes} minutes and #{print_time_seconds} seconds")
      @win_check = true
    else
      @guess_count += 1
      #puts colors #debug: show secret sequence
      puts Messager.output("'#{guess.join.upcase}' has #{compare} of the correct elements with #{check.count(true)} in the correct positions.\nYou've taken #{@guess_count} guesses.")
    end

  end

  def compare
    temp_board = colors

    @guess.count do |peg|
      temp_board.delete_at(temp_board.index(peg)) if temp_board.include?(peg)
    end
  end

  def check
    colors.zip(@guess).map { |x, y| x == y }
  end

  def win?
    check.count(true) == @board.size
  end

  def print_time_minutes
    @finish_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
  end

  def print_time_seconds
    #fix if start times seconds are great than finish time seconds
    @finish_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
  end

end
