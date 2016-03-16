require_relative "board"
require_relative "human_player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @players = { white: Player.new(@board, "White"), black: Player.new(@board, "Black") }
    @current_player = @players[:white]
  end

  def run
    @board.populate_board


    # Move it around and press enter to select
    # When they do press enter, then we identify the piece
    # Then we change teh color of that_piece.moves
    # Then we ask for a to_value
    # Then, if it's valid, we do it.

    #TODO add appropriate checkmate logic
    until @board.won?
      play_move
    end


      # pos = @player.move
      # byebug
      # @board.mark(pos)

    # end
    puts "Hooray, the board is filled.....with the blood of your fallen pieces."
  end

  #TODO add custom errors!!
  def play_move

    begin
      start_square = @current_player.move

      if @board[*start_square].class == EmptySquare
        raise StandardError
      end
    rescue StandardError
      puts "This square is empty, please choose a different starting position"
      sleep(1)
      # puts "This will reset in 3..."
      # sleep(1)
      # puts "2..."
      # sleep(1)
      # puts "1..."
      # sleep(1)

      # WE NEED TO RESET THE selected_pos
      retry
    end
    #
    begin
      end_square = @current_player.move
      unless @board[*start_square].valid_moves.include?(end_square)
        raise StandardError
      end
    rescue StandardError
      puts "Dude, obviously you can't go there."
      puts "For more information, please Google 'chess for idiots'"
      sleep(1)
      # puts "Choose a better end move in 3..."
      # sleep(1)
      # puts "2..."
      # sleep(1)
      # puts "1..."
      # sleep(1)
      retry
    end
    @board.move_piece(start_square, end_square)
    # puts "Alright, your turn is done, #{@current_player.name}"
    # switch_players
    # puts "It's #{@current_player.name}'s turn"
    # sleep(2)





  end

  def switch_players
    if @current_player == @players[:white]
      @current_player = @players[:black]
    else
      @current_player = @players[:white]
    end
  end

end

chessplay = Game.new
chessplay.run
