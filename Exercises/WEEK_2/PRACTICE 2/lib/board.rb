class Board

    def self.build_stacks(stacks)
        Array.new(stacks) { Array.new(0) }
    end

    attr_reader :max_height
    def initialize(stacks, max_height)
        if stacks < 4 || max_height < 4
            raise "rows and cols must be >= 4"
        end
        @max_height = max_height
        @stacks = Board.build_stacks(stacks)
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        end
        return false
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
            stack.each do |el|
                if stack.length == @max_height && stack.all? { |ele| ele == token }
                    return true
                end
            end
        end
        return false
    end

    def horizontal_winner?(token)
        transposed = []

        (0...@stacks.length).each do |row|
            new_row = []
            (0...@stacks.length).each do |col|
                new_row << @stacks[col][row]
            end
            transposed << new_row
        end

        transposed.each do |transpose|
            if transpose.all? { |el| el == token }
                return true
            end
        end
        return false 
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
    
end
