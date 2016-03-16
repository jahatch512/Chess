class Pawn < Piece



  def to_s
    # "\u2659" if color == :black
    " \u2708 "
  end

  def general_moves
    #while pawn is at [row][column]
  end
  def display_available_moves
    if @pos.selected?

      board[row + 1][column].highlight

    end

  end

end
