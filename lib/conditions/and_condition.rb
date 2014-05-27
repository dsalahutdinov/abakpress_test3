#
# Абстрактное предстваление условия "И"
#
class AndCondition < CompositeCondition
  def to_s
    return conditions.collect{|c| "(#{c.to_s})" }.join(" and ")
  end
end