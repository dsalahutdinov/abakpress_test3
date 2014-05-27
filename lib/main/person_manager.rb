#
# Класс-демонстрационное предстваление "таблицы" данных о персонах и индексами по всем полям
#
class PersonManager
  def initialize()
    @indexes = { }
    [:key, :age, :salary, :growth, :weight].each {|field_name| @indexes[field_name] = PersonIndex.new(field_name) }
    @people = []
  end
  
  def get_index(field_name)
    @indexes[field_name]
  end
  
  def people
    return @people
  end
    
  def insert(person)
    [:key, :age, :salary, :growth, :weight].each {|field_name| @indexes[field_name].insert(person) } 
    @people << person
  end

  def query(condition)
    condition.compute(self)
  end
end