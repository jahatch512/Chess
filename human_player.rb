
require_relative "display"

class Player

  attr_reader :name

  def initialize(board, name)
    @display = Display.new(board)
    @name = name
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end
