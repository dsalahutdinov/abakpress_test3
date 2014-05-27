#
# Реализация условия < для персоны, вычисляющая результат с помощью индекса (дерева поиска)
#
class PersonLessCondition < LessCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    person_manager.get_index(self.field_name).search_less(value)
  end
end