require 'spec_helper'

describe OrCondition do
  it "to_s prints fine string" do
    @condition = OrCondition.new(GreaterCondition.new(:salary, 1), LessCondition.new(:salary, 1))
    @condition.to_s.should == "(salary > 1) or (salary < 1)"
  end
end