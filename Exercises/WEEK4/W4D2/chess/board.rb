require_relative "piece.rb"

class Board

  def initialize
    @board = Array.new(8) { Array.new(8, nil) }
    (0...@board.length).each do |row|
      (0...@board.length).each do |col|
        if row == 0  || row == 1 || row == 6 || row == 7
          @board[row][col] = 'x'
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)

  end

  def print_board
    p self
  end

end

b = Board.new
p b