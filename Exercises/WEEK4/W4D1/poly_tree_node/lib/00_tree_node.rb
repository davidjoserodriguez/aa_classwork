class PolyTreeNode
  attr_reader :parent, :children, :value

  def self.root_node(position)
    PolyTreeNode.new(position)
  end

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node) #instance is B, B is a brand new instance
    old_parent = self.parent #old_parent = self.partent (nil)

    if old_parent != nil #skip
      old_parent.children.delete(self)
    end

    @parent = parent_node #B's @parent instance variable = parent_node parameter(A)
    
    if self.parent != nil #self.parent = A
      self.parent.children << self if !self.parent.children.include?(self)
      #B's @parent (A), A's children << B
    end 
  end
    
  def add_child(child_node) #a.add_child(b), b.parents = a
    child_node.parent = self # making the child's parent = current instance
    #@children << child_node # adding parameter child_node to current instance's @children array
  end

  def remove_child(child_node)
    raise 'node is not a child' if child_node.parent == nil
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    
    self.children.each do |children|
      search_result = children.dfs(target_value)
      return search_result  unless search_result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target_value
      el.children.each {|child| queue << child}
    end
    return nil
  end
end