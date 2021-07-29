require_relative "piece.rb"
# require_relative "Slideable"

class Rook < Piece
  include Slideable

  def symbol
    'x'.colorize(color)
  end

  protected

  def move_dirs
    HORIZONTAL_DIR
  end
end