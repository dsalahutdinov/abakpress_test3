#
# Класс, реализующий логику работы двоичного дерева поиска
#
class Tree
  attr_reader :root_node, :field_reader
  def initialize(field_reader)
    @field_reader = field_reader
  end
  
  def insert(object)
    if (@root_node.nil?)
      @root_node = Node.new(nil, object, field_reader)
    else
      @root_node.insert(object)
    end
  end
  
  def search(value)
    @root_node.search(value)
  end
  
  def search_less(value)
    @root_node.search_less(value)
  end
  
  def search_greater(value)
    @root_node.search_greater(value)
  end
end