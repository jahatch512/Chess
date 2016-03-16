



class EmptySquare

  attr_accessor :pos

  def initialize(board, pos)
    @board = board
    @pos = pos
    @icon = "   "
  end

  def inspect
    @icon
  end

  def to_s
    @icon
  end

end
