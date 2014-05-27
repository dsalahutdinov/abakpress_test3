#
# Реализация условия in (.....) для персоны, вычисляющая результат с помощью индекса (дерева поиска)
#
class PersonInCondition < InCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    s = PersonSet.new
    for v in self.value
      s = s.or(field_name.eq(v).compute(person_manager))
    end
    s
  end
end