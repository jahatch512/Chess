



class EmptySquare

  attr_reader :coordinates

  def initialize(board, coordinates)
    @board = board
    @coordinates = coordinates
    @null_piece = "   [   ]   "
  end

  def inspect
    @null_piece
  end

  def to_s
    @null_piece
  end

end
