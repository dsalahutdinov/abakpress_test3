#
# Абстрактное предстваление составеного условия ИЛИ
#

class OrCondition < CompositeCondition
  def to_s
    return conditions.collect{|c| "(#{c.to_s})" }.join(" or ")
  end
end