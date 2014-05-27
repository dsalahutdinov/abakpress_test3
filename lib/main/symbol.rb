#
# Расширяем класс фунциями для упрощенного создания объектов-условий
# к примеру, :salary.gt(100)
#
class Symbol
  def gt(n)
    PersonGreaterCondition.new(self, n)
  end
  
  def eq(n)
    PersonEqualCondition.new(self, n)
  end
  
  def lt(n)
    PersonLessCondition.new(self, n)
  end
  
  def in(*n)
    PersonInCondition.new(self, n)
  end
end