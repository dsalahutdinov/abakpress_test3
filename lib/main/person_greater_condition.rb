#
# Реализация условия > для персоны, вычисляющая результат с помощью индекса (дерева поиска)
#
class PersonGreaterCondition < GreaterCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    person_manager.get_index(self.field_name).search_greater(value)
  end
end