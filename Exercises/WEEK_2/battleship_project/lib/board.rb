class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N) }
        @size = n * n
    end

    def[](array)
        
        row,col = array

        @grid[row][col]
    end

    def[]=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |el|
              if el == :S
                count += 1
              end
            end
        end
        count 
    end

    def attack(position)
        attempt = self[position]
        
        if attempt == :S 
            #self[position] = :H
            self.[]=(position, :H)
            print "you sunk my battleship!"
            return true
        else
            #self[position] = :X
            self.[]=(position, :X) 
            return false
        end

    end

    def place_random_ships
        
    end

 
end
