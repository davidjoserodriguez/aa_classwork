require "singleton"

module Slideable

  HORIZONTAL_DIRS = [
    [:dx, :dy], # left
    [:dx, :dy], # right
    [:dx, :dy], # up (vertical)
    [:dx, :dy]  # down (vertical)
  ].freeze

  DIAGONAL_DIRS = [
    [:dx, :dy], # up + left
    [:dx, :dy], # up + right
    [:dx, :dy], # down + left
    [:dx, :dy]  # down + right
  ].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []

    (0...HORIZONTAL_DIRS.length).each do |row|
      (0...row.length).each do |col|
        end
      end
  end

end

module Stepable
  def moves
  end
end

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    possible_moves = []
    self
  end

end

class NullPiece < Piece
include Singleton
  def initialize
  end
end

piece = Rook.new('white', board, [2, 3])
p piece.move_dirs