#
# Реализация условия И с логикой вычисления результата: последовательно объединяются результаты всех подусловий
#

class PersonAndCondition < AndCondition
  include PersonConditionOperators
  
  def compute(person_manager)
    s = PersonSet.new(person_manager.query(self.conditions.first))
    1.upto(self.conditions.length - 1) do |n|
      s = s.and(person_manager.query(self.conditions[n]))
    end
    s
  end
end