require_relative "stepping_piece"

class King < Piece

  include SteppingPiece

  def to_s
    " \u2622 "
  end

  def move_dirs
    linear_dirs + diagonal_dirs
  end


end
