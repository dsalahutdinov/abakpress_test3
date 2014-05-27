require 'spec_helper'

describe AndCondition do
  it "to_s prints fine string" do
    @condition = AndCondition.new(GreaterCondition.new(:salary, 1), LessCondition.new(:salary, 1))
    @condition.to_s.should == "(salary > 1) and (salary < 1)"
  end
end