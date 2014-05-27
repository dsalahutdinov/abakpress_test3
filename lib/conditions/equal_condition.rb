#
# Абстрактное предстваление условия field == 
#

class EqualCondition < CompareCondition
  def to_s
    return "#{field_name.to_s} == #{value}"
  end
end