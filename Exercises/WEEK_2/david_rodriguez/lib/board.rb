class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all? do |space|
                space == mark
            end
        end
    end

    def complete_col?(mark)
        @grid.transpose.any? do |col|
            col.all? do |space|
                space == mark
            end
        end
    end

    def complete_diag?(mark) 
        
        
        (0...@grid.length).all? do |i|
            @grid[i][i] == mark || @grid[i][-i-1] == mark
       end
   end


        # if @grid[0][3] == mark && @grid[1][1] == mark && @grid[3][0] == mark
        #     return true
        # end

        # (0...@grid.transpose.length).all? do |i|
        #     if grid[i][i] == mark
        #         return true
        #     end
        # end

    

    def winner?(mark)
        
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end



       

   
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
