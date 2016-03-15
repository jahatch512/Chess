class Rook < Piece
include SlidingPiece

  def to_s
    "      \u2721      "
  end

  def move_dirs
    linear_dirs
  end


end
