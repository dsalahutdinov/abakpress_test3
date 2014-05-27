#
# Класс, реализующий "отложенную" логику обхода дерева.
# Результат поиска - это несколько классов обходчиков, из которых можно последовательно получать
# результирующие узлы дерева в "lazy" режиме
# В зависимости от подкласса, реализует прямой, обратный, "без под-узлов" обход дерева.
# Либо работает как заглушка(для унифицированного возврата пустого результата)
#
class TreeTraverser
  include Enumerable
  @root_node = nil
  attr_reader :root_node
  
  def initialize(root_node)
    @root_node = root_node
  end
  
  def each &block
    self.traverse(root_node, block)
  end
  
  def traverse(node, block)
    raise NotImplementedError
  end
end

class LeftRightTraverser < TreeTraverser  
  def traverse(node, block) 
    self.traverse(node.left, block) if node.left
    block.call(node)
    self.traverse(node.right, block) if node.right
  end    
end

class RightLeftTraverser< TreeTraverser
  def traverse(node, block) 
    self.traverse(node.right, block) if node.right
    block.call(node)
    self.traverse(node.left, block) if node.left
  end
end

class OneNodeTraverser < TreeTraverser 
  def traverse(node, block) 
    block.call(node)
  end    
end

class EmptyNodeTraverser < TreeTraverser 
  def initialize()
  end
  def traverse(node, block) 
  end    
end