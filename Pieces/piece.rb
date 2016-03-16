require 'colorize'
require 'byebug'
class Piece
  include Cursorable

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
    @icon = self.class
  end
  #
  # def move
  # end

  #
  # def moves
  #
  # end

  def valid_moves
    moves.reject {|move| move_into_check?(move)}
  end

  def move_into_check?(ending_square)
    test_board = board.duping
    test_board.move_piece(pos, ending_square)
    test_board.in_check?(color)
  end

  def to_s
    "  [ #{@icon.capitalize} ]   "
  end


end
