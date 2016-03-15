require_relative "board"
require_relative "human_player"
require 'byebug'

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    @board.populate_board


    # Move it around and press enter to select
    # When they do press enter, then we identify the piece
    # Then we change teh color of that_piece.moves
    # Then we ask for a to_value
    # Then, if it's valid, we do it.

    #
    loop do
      play_move
    end


      # pos = @player.move
      # byebug
      # @board.mark(pos)

    # end
    puts "Hooray, the board is filled!"
  end

  def play_move

    start_square = @player.move
    end_square = @player.move
    @board.move_piece(start_square, end_square)


    #
    # byebug
    # @board.mark(pos)


  end


end

chessplay = Game.new
chessplay.run
