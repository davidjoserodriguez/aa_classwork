require_relative "piece.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        if row == 0  || row == 1 || row == 6 || row == 7
          @grid[row][col] = 'x'
        end
      end
    end

  end

  def [](position)
    x, y = position
    @grid[x][y]
  end

  def []=(new_position, value)
    x, y = new_position
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    start_piece = self[start_pos]
    end_piece = self[end_pos]
    raise "No piece there can't start" if start_piece == NullPiece.instance

    if end_piece == NullPiece.instance
      self[end_pos] = start_piece
      self[start_pos] = NullPiece.instance
     else
      if self[start_pos].piece.color == "white"
        if self[end_pos].piece.color == "white"
          raise "Error, you cant move there"
        else
          self[end_pos] = self[start_pos]
          self[start_pos] = NullPiece.instance
        end
      elsif self[start_pos].piece.color == "black"
        if self[end_pos].piece.color == "black"
          raise "Error, you cant move there"
        else
          self[end_pos] = self[start_pos]
          self[start_pos] = NullPiece.instance
        end
      end
    end
      # begin
    #   raise "Error, there is no piece at that position" if self[start_pos] == NullPiece.instance


    #   raise "Error, cannot move to position - already taken" if self[end_pos] == 'x'

  end

  def print_board
    p self
  end

end

b = Board.new
b.print_board

p b.move_piece([0,0], [2,0])
p b.print_board
