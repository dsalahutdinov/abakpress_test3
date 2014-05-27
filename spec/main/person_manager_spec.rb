require 'spec_helper'
 
describe PersonManager do
  it "initializes correctly" do
    db = PersonManager.new
    1000.times {|n| db.insert(Person.generate) }
    db.people.count.should == 1000
    [:key, :age, :salary, :growth, :weight].each do |field_name|
      db.get_index(field_name).should_not == nil
    end
  end
  
  it "passes queries" do
    db = PersonManager.new
    1000.times {|n| db.insert(Person.generate) }
    
    db.query(:salary.lt(10000)).collect(&:key).sort.should ==
        db.people.select{|p| p.salary < 10000 }.collect(&:key).sort
        
    db.query(:salary.gt(100) & :age.gt(100)).collect(&:key).sort.should ==
        db.people.select{|p| p.salary > 100 and p.age > 100 }.collect(&:key).sort
        
    db.query(:salary.lt(10000) & :salary.gt(10001)).collect(&:key).count.should == 0
    
    db.query(:salary.eq(10000)).collect(&:key).should == 
        db.people.select{|p| p.salary  == 10000 }.collect(&:key).sort
        
    db.query(:age.in(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)).collect(&:key).sort.should == 
        db.people.select{|p| (1..10).to_a.include?(p.age) }.collect(&:key).sort
  end
end