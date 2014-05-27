#
# Абстрактное предстваление условия попадание значения поля в множество вариантов
#

class InCondition < FieldCondition
  attr_reader :value

  def initialize(field_name, value)
    raise ArgumentError unless value.is_a?(Array)
    raise ArgumentError if value.select{|i| !i.is_a?(Fixnum) }.count > 0
    super(field_name)
    @value = value
  end

  def to_s
    return "#{field_name.to_s} in (#{value.join(', ')})"
  end
end