

module SlidingPiece
  LINEAR_DIRS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1]
  ]

  DIAGONAL_DIRS = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]


  def linear_dirs
    LINEAR_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(grow_moves(dx, dy))
    end
    moves
  end

  def grow_moves(dx, dy)
    current_x, current_y = pos
    grown = []

    loop do
      current_x, current_y = current_x + dx, current_y + dy
      pos = current_x, current_y

      break unless board.in_bounds?(pos)

      if board.empty?(pos)
        grown << pos
      else
        grown << pos if board[*pos].color != color
        break
      end
    end

    grown
  end



end
