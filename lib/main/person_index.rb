#
# Индекс для быстрого поиска по значению определенного поля, обертка для класса Tree
# делегирующая все функции классу Tree
#
class PersonIndex
  def initialize(field_name)
    @tree = Tree.new(lambda {|person| person.send(field_name)})
  end
  
  def insert(person)
    @tree.insert(person)
  end
  
  def search(value)
    PersonEnumerator.new(@tree.search(value))
  end
  
  def search_less(value)
    PersonEnumerator.new(@tree.search_less(value))
  end
  
  def search_greater(value)
    PersonEnumerator.new(@tree.search_greater(value))
  end
end