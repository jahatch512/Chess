# def valid_moves
#   moves.reject { |move| move_into_check?(move) }
# end

# def move_into_check?(ending_square)
#   test_board = board.dup
#   test_board.move_piece!(pos, ending_square)
#   test_board.in_check?(color)
# end
#
# def dup
#   new_board = Board.new
#
#   all_tiles.each do |piece|
#     piece.class.new(piece.color, new_board, piece.pos)
#   end
#
#   new_board
# end

# def checkmate?(color)
#   return false unless in_check?(color)
#
#   our_pieces = pieces.select { |piece| piece.color == color }
#
#   our_pieces.all? do |piece|
#     piece.valid_moves.empty?
#   end
# end
