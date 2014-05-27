#
# Множество персон, поддерживающее операции объединения множеств.
# Работает на основе хеш-таблицы, оптимальной структуры данных для
# поиска по значению (точному совпадению)
# в общем случае время операции добавления/поиска ~ O(1),
# соответственно время операции объединения O(n) - O(n+m), в зависимости от типа объединения,
# где n, m - кол-во элементов в соответствующих множествах
#
class PersonSet
  attr_reader :data
  include Enumerable
  def each &block
    @data.each {|p| block.call(p) }
  end
  
  def initialize(enumerable = nil)
    @hash = {}
    @data = []

    unless enumerable.nil?
      for person in enumerable
        self.add(person)
      end
    end
  end
  
  def include?(person)
    !@hash[person.key].nil?
  end
  
  def add(person)
      @hash[person.key] = person
      @data << person
  end
  
  def or(y)
    set = PersonSet.new(self) 
    for person in y
      set.add(person) unless set.include?(person)
    end
    return set
  end
  
  def and(y)
    set = PersonSet.new() 
    for person in y
      set.add(person) if self.include?(person)
    end
    for person in self
      set.add(person) if y.include?(person) and !set.include?(person)
    end
    return set
  end
end