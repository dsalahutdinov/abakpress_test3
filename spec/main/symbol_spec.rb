require 'spec_helper'
 
describe Symbol do
  it "initializes correctly" do
   
    :salary.respond_to?(:lt).should == true
    :salary.respond_to?(:lt).should == true
    :salary.respond_to?(:eq).should == true
    :salary.respond_to?(:in).should == true
    
    condition = :salary.lt(10000)
    condition.class.should  == PersonLessCondition
    condition.field_name.should == :salary
    condition.value.should == 10000
    
    condition = :salary.gt(10000)
    condition.class.should  == PersonGreaterCondition
    condition.field_name.should == :salary
    condition.value.should == 10000
    
    
    condition = :salary.eq(10000)
    condition.class.should  == PersonEqualCondition
    condition.field_name.should == :salary
    condition.value.should == 10000
    
    
    condition = :salary.in(1, 2, 3)
    condition.class.should  == PersonInCondition
    condition.field_name.should == :salary
    condition.value.should == [1, 2, 3]
  end
end