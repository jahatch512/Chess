class Knight < Piece
  include SteppingPiece

  def to_s
    " \u265E "
  end

  def move_dirs
    knight_dirs
  end

end
