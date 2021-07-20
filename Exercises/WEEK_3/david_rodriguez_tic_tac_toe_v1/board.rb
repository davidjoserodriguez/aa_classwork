class Board
    
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def valid?(position)
        row, col = position 
        row >= 0 && row < @grid.length && col >= 0 && col < @grid.length
    end

    def empty?(position)
        row, col = position

        @grid[row][col] == "_"
            
    end

    def place_mark(position, mark)
        row, col = position 
        if self.valid?(position) && self.empty?(position)
            @grid[row][col] = mark
        else
            raise "error invalid mark"
        end
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end


    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |space| space == mark }
        end
    end

    def win_col?(mark)
        @grid.transpose.any? do |col|
            col.all? { |space| space == mark }
        end
    end

    def win_diagonal?(mark)
        return true if (0...@grid.length).all? do |i|
            @grid[i][i] == mark 
        end


        return true if (0...@grid.length).all? do |i|
            @grid.transpose[i][i] == mark
        end

        return false
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? do |space|
            space == "_"
        end
    end
  
end