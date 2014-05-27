#
# Хелпер, для введения в реализацию условий методов, перегружающих операции | &
#
module PersonConditionOperators
  require "main/person_and_condition.rb"
  require "main/person_or_condition.rb"
  
  def &(another)
    PersonAndCondition.new(self, another)
  end
  
  def |(another)
    PersonOrCondition.new(self, another)
  end
end
