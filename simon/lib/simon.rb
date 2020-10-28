require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)
  PRINT_COLORS = { 
    "red" => "red".colorize(:red),
    "blue" => "blue".colorize(:blue),
    "green" => "green".colorize(:green), 
    "yellow" => "yellow".colorize(:yellow) }

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    welcome_message
    until game_over?
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    puts "remember this sequence:"
    sleep(2)
    show_sequence
    require_sequence
    unless game_over?
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    seq.each do |color|
      puts PRINT_COLORS[color]
      sleep(1)
    end
  end

  def require_sequence
    system("clear")
    puts "enter the sequence:"
    seq.each do |color|
      input = gets.chomp
      unless input == color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.shuffle.last
  end

  def round_success_message
    puts "Correct!"
    sleep(2)
  end

  def game_over_message
    puts "Incorrect!"
    puts "Game Over"
    puts "Your longest chain was: #{@sequence_length - 1}"
    sleep(3)
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def game_over?
    @game_over
  end

  private
  def welcome_message
    system("clear")
    puts "Welcome to Simon!"
    sleep(2)
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end