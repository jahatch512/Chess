require_relative "board"
require_relative "human_player"

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    # until @board.full?
      pos = @player.move
      @board.mark(pos)
    # end
    puts "Hooray, the board is filled!"
  end
end

chessplay = Game.new
chessplay.run
