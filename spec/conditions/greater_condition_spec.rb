require 'spec_helper'

describe GreaterCondition do
  it "to_s makes sql-like query condition" do
    @condition = GreaterCondition.new(:salary, 1)
    @condition.to_s.should == "salary > 1"
  end
end