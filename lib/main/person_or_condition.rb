#
# Реализация составного условния "ИЛИ" для персон, объяединает результаты вычисления всех подусловий
#
class PersonOrCondition < OrCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    s = PersonSet.new
    for c in self.conditions
      s = s.or(c.compute(person_manager))
    end
    s
  end
end