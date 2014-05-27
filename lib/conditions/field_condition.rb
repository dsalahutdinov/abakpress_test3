#
# Абстрактное предстваление условия на определенное поле
#

class FieldCondition < Condition
  attr_reader :field_name

  def initialize(field_name)
    raise ArgumentError unless field_name.respond_to?(:to_sym)
    raise ArgumentError if field_name.to_sym == :""
    @field_name = field_name.to_sym
  end
end
