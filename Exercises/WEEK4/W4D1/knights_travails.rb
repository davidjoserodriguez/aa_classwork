require "./poly_tree_node/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :considered_positions, :root

    def self.valid_moves(position)
        x, y = position
        valid_moves = [
        [-2, -1], 
        [ 2, -1],
        [-2, 1],
        [2, 1],
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2]]

        selected_moves = valid_moves.select do |move|
            x_move = x + move[0]
            y_move = y + move[1]
            x_move >= 0 && x_move <= 7 && y_move >= 0 && y_move <= 7
        end

        selected_moves.map {|move| [ move[0] + x, move[1] + y ]}
    
    end
        
    


    def initialize(position)
        @starting_position = position
        @current_position = []
        @root = PolyTreeNode.root_node(@starting_position)
        @considered_positions = [position]
        self.build_move_tree 
        
    end

    def find_path(end_pos)
        n = @root.bfs(end_pos)
        trace_val_back(n)
    end

    def trace_val_back(node)
        # return nil if node == nil
        return [node.value] if node.parent == nil
        res = trace_val_back(node.parent) 
        res << node.value
        res


    end

    def build_move_tree
        queue = [@root]
        until queue.empty?
            el = queue.shift

            children = self.new_move_positions(el.value)
            
            children.each do |pos|
                el.add_child(PolyTreeNode.new(pos))
                # el.children << new_node
                # new_node.parent << el
            end

            el.children.each {|child| queue << child}
            
            
        end
        nil
    end

    def new_move_positions(position)
        moves = KnightPathFinder.valid_moves(position)
        new_moves = []
        moves.each { |move| new_moves << move if !@considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end

end

# k = KnightPathFinder.new([0,0])
# k.build_move_tree
# p k.considered_positions.length

p kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6])
# p kpf.find_path([6, 2])