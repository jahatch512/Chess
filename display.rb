# require 'board'
require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :board
  attr_accessor :selected

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0] #change back to [0, 0]
    @selected = false
  end

  def selected?
    @selected
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    # elsif [i, j] == @selected_pos
    #   bg = :yellow
    elsif board[*@cursor_pos].class != EmptySquare && board[*@cursor_pos].moves.include?([i, j])
      bg = :green
    elsif @selected_pos && board[*@selected_pos].class != EmptySquare && board[*@selected_pos].moves.include?([i, j])
        bg = :yellow
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white }
  end

  def render
    system("clear")
    # puts "Fill the grid. #{@current_player.name}!"
    # puts "This is what we are looking for #{board.empty?([1,1])}"
    puts "Arrow keys, WASD, or vim to move, space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end
  #
  # def get_input
  #
  # end

end
