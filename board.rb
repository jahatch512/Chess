require_relative "empty_square"
require_relative "display"

class Board

  attr_reader :rows

  def initialize
    make_empty_board
  end

  def make_empty_board
    @grid = Array.new(8) do |row|
      Array.new(8) { |col| EmptySquare.new(self, [row, col]) }
    end
  end

  def []=(row, column, value)
    @grid[row][column] = value
  end

  def [] (row, column)
    @grid[row][column]
  end

  def rows
    @rows = []
    @grid.each do |row|
      @rows << row
    end
    @rows
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def move(start_square, end_square)
    # Raise an exception if there is no piece at the start_square
    # Raise an exception if the end_square is not a valid move
  end

  def populate_board

  end

  # 
  # def populate_black
  #   grid[0,0] = Rook.new(:rook, :black, [0,0], self)
  #   grid[0,1] = Knight.new(:knight, :black, [0,1], self)
  #   grid[0,2] = Bishop.new(:bishop, :black, [0,2], self)
  #   grid[0,3] = King.new(:king, :black, [0.3], self)
  #   grid[0,4] = Queen.new(:queen, :black, [0,4], self)
  #   grid[0,5] = Bishop.new(:bishop, :black, [0,5], self)
  #   grid[0,6] = Knight.new(:knight, :black, [0,6], self)
  #   grid[0,7] = Rook.new(:rook, :black, [0,7], self)
  #
  #   grid[1,0] = Pawn.new(:pawn, :black, [1,0], self)
  #   grid[]
  #
  #


end

a = Board.new

d = Display.new(a)
d.render
