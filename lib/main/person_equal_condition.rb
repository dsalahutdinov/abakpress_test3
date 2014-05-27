#
# Реализация условия == для персоны, вычисляющая результат с помощью индекса (дерева поиска)
#

class PersonEqualCondition < EqualCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    person_manager.get_index(self.field_name).search(value)
  end
end