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

  def parent=(parent_node)
    old_parent = self.parent

    if old_parent != nil
      old_parent.children.delete(self)
    end

    @parent = parent_node
    if self.parent != nil
      self.parent.children << self if !self.parent.children.include?(self)
    end 
  end
    
  def add_child(child_node)
    child_node.parent = self
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