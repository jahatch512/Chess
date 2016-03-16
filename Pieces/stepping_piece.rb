require 'byebug'
module SteppingPiece
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

  KNIGHT_DIRS = [
    [1,2],
    [-1,2],
    [1,-2],
    [-1,-2],
    [2,1],
    [2,-1],
    [-2,1],
    [-2,-1]
  ]

  def linear_dirs
    LINEAR_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def knight_dirs
    KNIGHT_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves.concat(test_moves(dx, dy))
    end
    moves
  end

  def test_moves(dx, dy)
    grown = []
    current_x, current_y = pos


    current_x, current_y = current_x + dx, current_y + dy
    pos = current_x, current_y

    if board.in_bounds?(pos)
      grown << pos if board.empty?(pos) || board[*pos].color != color
    end

    # if board.empty?(pos) && board.in_bounds?(pos)
    #   grown << pos
    # else
    #   grown << pos if board[*pos].color != color
    # end

    grown
  end
end
