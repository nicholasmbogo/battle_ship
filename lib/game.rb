require './lib/board'
class Game

  attr_reader :computer_board
  attr_accessor :game_in_progress

  def initialize
    @game_in_progress = false
    @computer_board = Board.new
  end

  def start_game
    puts "Welcome to BATTLESHIP"
    puts "would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    print "> "
    input = $stdin.gets.chomp
    puts input

    if input == "p" || input == "play"
      @game_in_progress = true
      setup_boards

    elsif input == "i" || input == "instructions"
      puts "This is how you play the game"
      start_game

    elsif input == "q" || input == "quit"
      exit(0)

    else
      puts "Sorry!!, I did not understand that!"
      start_game

    end

  end

  def setup_boards
   @computer_board.setup_computer_board
  end
end
#Game.new.start_game
