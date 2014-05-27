require 'spec_helper'

describe LessCondition do
  it "to_s makes sql-like query condition" do
    @condition = LessCondition.new(:salary, 1)
    @condition.to_s.should == "salary < 1"
  end
end