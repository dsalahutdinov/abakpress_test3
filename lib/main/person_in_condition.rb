#
# Реализация условия in (.....) для персоны, вычисляющая результат с помощью индекса (дерева поиска)
#
class PersonInCondition < InCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    s = PersonSet.new
    for v in self.values
      s = s.or(PersonSet.new(person_manager.get_index(self.field_name).search(value)))
    end
  end
end