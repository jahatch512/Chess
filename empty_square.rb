



class EmptySquare

  attr_reader :coordinates

  def initialize(board, coordinates)
    @board = board
    @coordinates = coordinates
    @icon = "             "
  end

  def inspect
    @icon
  end

  def to_s
    @icon
  end

end
