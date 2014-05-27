#
# Класс, позволящуй легко и просто осуществить последовательный выбор узлов из
# "обходчиков" дерева
#
class NodeEnumerator
  include Enumerable
  attr_reader :items
  
  def initialize(*items)
    @items = items
  end
   
  def each &block
    for item in items
      if (item.is_a?(Node))
        block.call(item)
      end
      if (item.is_a?(TreeTraverser) or item.is_a?(NodeEnumerator))
        for node in item
          block.call(node)
        end
      end
    end
  end
  
  def add(item)
    items << item
  end
end