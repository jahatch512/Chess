require_relative "sliding_piece"

class Queen < Piece

  include SlidingPiece

  def to_s
    " \u262F "
  end

  def move_dirs
    linear_dirs + diagonal_dirs
  end


end
