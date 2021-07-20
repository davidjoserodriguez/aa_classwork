require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @grid = Array.new(n) { Array.new(n) }
    end
end
