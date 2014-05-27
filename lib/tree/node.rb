#
# Узел дерева для двоичного поиска, фунционал вставки, поиска узла по значению, поиска > <
#
class Node
  attr_reader :left, :right, :parent
  attr_reader :value, :objects
  attr_reader :field_reader
  
  def initialize(parent, object, field_reader)
    @parent = parent
    @field_reader = field_reader
    @value, @objects = field_reader.call(object), [ object ]
  end
  
  def search(target_value)
    return NodeEnumerator.new(OneNodeTraverser.new(self)) if (self.value == target_value)
    return self.right.search(target_value) if (target_value > self.value && self.right)
    return self.left.search(target_value) if (target_value < self.value && self.left)
    return NodeEnumerator.new(EmptyNodeTraverser.new())
  end

  def search_less(target_value)
    result_nodes = NodeEnumerator.new
    if (self.value >= target_value)
      result_nodes.add(self.left.search_less(target_value)) if self.left
    else
      result_nodes.add(LeftRightTraverser.new(self.left)) if self.left
      result_nodes.add(self)
      result_nodes.add(self.right.search_less(target_value)) if self.right
    end
    result_nodes
  end
  
  def search_greater(target_value)
    result_nodes = NodeEnumerator.new
    if (self.value <= target_value) 
      result_nodes.add(self.right.search_greater(target_value)) if self.right
    else
      result_nodes.add(RightLeftTraverser.new(self.right)) if self.right
      result_nodes.add(self)
      result_nodes.add(self.left.search_greater(target_value)) if self.left
    end
    result_nodes
  end

  def insert(object)
    case @value <=> field_reader.call(object)
    when 1
      if @left.nil?
        @left = Node.new(self, object, field_reader)
      else
        @left.insert(object)
      end
    when 0
      @objects << object unless object.nil?
    when -1
      if @right.nil?
        @right = Node.new(self, object, field_reader)
      else
        @right.insert(object)
      end
    end
  end
end






