

class Piece

  attr_reader :type, :color, :pos

  def initialize(type, color, pos, board)
    @type = type
    @color = color
    @pos = pos
    @board = board
  end
  #
  # def move
  # end
  #
  # def moves
  # end

  def valid_move?
  end



end
