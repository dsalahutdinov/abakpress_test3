#
# Базовый класс для всех условий, задающий общий интерфейс работы с ними
#
class Condition
  def to_s
    raise NotImplementedError
  end
  
  def &(another)
    raise NotImplementedError
  end
  
  def |(another)
    raise NotImplementedError
  end
end