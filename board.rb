require_relative "empty_square"
require_relative "display"
require_relative "pieces"
require_relative "human_player"
require 'byebug'

class Board

  attr_reader :rows, :grid

  #TODO setup board here!
  def initialize
    @grid = empty_board
  end

  def empty_board
    Array.new(8) do |row|
      Array.new(8) { |col| EmptySquare.new(self, [row, col]) }
    end
  end

  def []=(row, column, value)
    @grid[row][column] = value
  end

  def [] (row, column)
    @grid[row][column]
  end

  #TODO ??
  def rows
    @rows = []
    @grid.each do |row|
      @rows << row
    end

    @rows
  end

  def empty?(pos)
    self[*pos].class == EmptySquare
  end


  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def move_piece(start_square, end_square)
    # if self[*start_square].class == EmptySquare
    #   raise "This square is empty, please choose a different starting position"
    # end
    #
    # unless self[*start_square].moves.include?(end_square)
    #   raise "This is not a valid move"
    # end

    self[*end_square] = self[*start_square].dup
    self[*end_square].pos = end_square
    self[*start_square] = EmptySquare.new(self, [start_square])


  end

  def populate_board
    populate_black
    populate_white
  end

  # SKILL_PIECE_LINE_UP =[
  #   Rook,
  #   Knight,...
  # ]

  #TODO DRY this up!
  def populate_black
    self[0,0] = Rook.new(:black, [0,0], self)
    self[0,1] = Knight.new(:black, [0,1], self)
    self[0,2] = Bishop.new(:black, [0,2], self)
    self[0,3] = King.new(:black, [0,3], self)
    self[0,4] = Queen.new(:black, [0,4], self)
    self[0,5] = Bishop.new(:black, [0,5], self)
    self[0,6] = Knight.new(:black, [0,6], self)
    self[0,7] = Rook.new(:black, [0,7], self)

    # self[1,0] = Pawn.new(:pawn, :black, [1,0], self)
    # self[1,1] = Pawn.new(:pawn, :black, [1,1], self)
    # self[1,2] = Pawn.new(:pawn, :black, [1,2], self)
    # self[1,3] = Pawn.new(:pawn, :black, [1,3], self)
    # self[1,4] = Pawn.new(:pawn, :black, [1,4], self)
    # self[1,5] = Pawn.new(:pawn, :black, [1,5], self)
    # self[1,6] = Pawn.new(:pawn, :black, [1,6], self)
    # self[1,7] = Pawn.new(:pawn, :black, [1,7], self)
  end

  def populate_white
    # self[6,0] = Pawn.new(:pawn, :white, [6,0], self)
    # self[6,1] = Pawn.new(:pawn, :white, [6,1], self)
    # self[6,2] = Pawn.new(:pawn, :white, [6,2], self)
    # self[6,3] = Pawn.new(:pawn, :white, [6,3], self)
    # self[6,4] = Pawn.new(:pawn, :white, [6,4], self)
    # self[6,5] = Pawn.new(:pawn, :white, [6,5], self)
    # self[6,6] = Pawn.new(:pawn, :white, [6,6], self)
    # self[6,7] = Pawn.new(:pawn, :white, [6,7], self)

    self[7,0] = Rook.new(:white, [0,0], self)
    self[7,1] = Knight.new(:white, [7,1], self)
    self[7,2] = Bishop.new(:white, [7,2], self)
    self[7,3] = King.new(:white, [7,3], self)
    self[7,4] = Queen.new(:white, [7,4], self)
    self[7,5] = Bishop.new(:white, [7,5], self)
    self[7,6] = Knight.new(:white, [7,6], self)
    self[7,7] = Rook.new(:white, [7,7], self)

  end

  def find_king(color)
    pieces.each do |piece|
      return piece if piece.class == King && piece.color == color
    end
  end

  def in_check?(color)
    king = find_king(color)
    king_pos = king.pos
    pieces.each do |piece|
      if piece.color != color && piece.moves.include?(king_pos)
        return true
      end
    end
    false
  end

  def duping
    new_board = Board.new

    all_tiles.each do |piece|
      if piece.is_a?(EmptySquare)
        EmptySquare.new(new_board, piece.pos)
      else
        new_board[*piece.pos] = piece.class.new(piece.color, piece.pos, new_board)
      # debugger
      end
    end

    new_board
  end

  def all_tiles

    result = []

    grid.each do |row|
      row.each do |piece|
        result << piece
      end
    end

    result
  end

  def pieces
    all_tiles.reject { |tile| tile.class == EmptySquare }
  end

  def checkmate?(color)
    return false unless in_check?(color)

    our_pieces = pieces.select { |piece| piece.color == color }

    our_pieces.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def won?
    checkmate?(:black) || checkmate?(:white)
  end

end


b = Board.new
