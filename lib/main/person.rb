#
# Модель данных для демонстрации программы
#

class Person
  @@last_key = 0
  
  attr_reader :key, :age, :salary, :growth, :weight
  
  def initialize(age, salary, growth, weight)
    @age, @salary, @growth, @weight = age, salary, growth, weight
    @key = @@last_key
    @@last_key += 1
  end
  
  def self.generate()
    Person.new((rand * 100).round, (rand * 1000000).round, (rand * 200).round, (rand*200).round)
  end
end