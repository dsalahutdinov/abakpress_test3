#
# Базовый класс для "составных условий", состоящих из других условий
#

class CompositeCondition < Condition
  def conditions
    return @conditions.dup.freeze
  end
  
  def initialize(*conditions)
    raise ArgumentError unless conditions.is_a?(Array)
    raise ArgumentError if conditions.select{|i| !i.is_a?(Condition) }.count > 0
    @conditions = conditions
  end
end