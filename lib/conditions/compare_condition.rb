#
# Базовый класс для условия сравнения со значением оппределенного поля
#
class CompareCondition < FieldCondition
  attr_reader :value

  def initialize(field_name, value)
    raise ArgumentError unless value.is_a?(Fixnum)
    super(field_name)
    @value = value
  end
end