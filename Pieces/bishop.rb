class Bishop < Piece
#
include SlidingPiece

  def to_s
    "      \u262D      "
  end

  def move_dirs
    diagonal_dirs
  end


end
