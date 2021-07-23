require "POLY_TREE_NODE/lib/00_tree_node.rb"

class KnightPathFinder
    def self.valid_moves(position)
        x, y = position
        return false if x < 0 || x > 7 || y < 0 || y > 7

        if x == @current_position[0] - 2 && y == @current_position[1] -1
            return true 
        
        elsif x == @current_position[0] - 2 && y == @current_position[1] + 1
            return true 
        elsif x == @current_position[0] + 2 && y == @current_position[1] - 1 
            return true 
        elsif x == @current_position[0] + 2 && y == @current_position[1] + 1
            return true 
        elsif x == @current_position[0] - 1 && y == @current_position[1] - 2
            return true 
        elsif x == @current_position[0] + 1 && y == @current_position[1] + 2
            return true 
        elsif x == @current_position[0] - 1 && y == @current_position[1] + 2
            return true 
        end
        
        false
    end


    def initialize(position)
        @starting_position = position
        @current_position = []
        @root = PolyTreeNode.root_node(starting_position)
        @considered_positions = [position]
        
    end

    def find_path

    end

    def build_move_tree
        x,y = starting_position
        queue = [@starting_position]

        q = []

        while x < 0 || x > 7
            q << new_moves_positions([x,y])
            x += 2
            y += 1
        end
        
        until queue.empty?
           el = x 
        end


    end

    def new_move_positions(position)
        if !@considered_positions.include?(position) && KnightPathFinder.valid_moves(position)
            @considered_positions << position
        end
        @considered_positions
    end

end