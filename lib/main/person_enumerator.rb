#
# Класс-адаптер, позволяющий осуществлять обхоcд по всем значениям
# содержащимся в услах дерева поиска. Работает на основе енумератора узлов
#
#

class PersonEnumerator
  include Enumerable
  
  def initialize(*node_enumerators)
    @node_enumerators = node_enumerators
  end
   
  def each &block
    for nodes in @node_enumerators
      for node in nodes
        for person in node.objects
          block.call(person)
        end
      end
    end
  end
end