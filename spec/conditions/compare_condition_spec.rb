require 'spec_helper'

describe CompareCondition do
  it "to_s raise exception" do
    @condition = CompareCondition.new(:salary, 1)
    expect { @condition.to_s }.to raise_error(NotImplementedError)
  end

  it "fixnum in contructor pass" do
    expect { @condition = CompareCondition.new(:salary, 1) }.not_to raise_error
  end
  
  it "no fixnum in constructor fail" do
    expect { @condition = CompareCondition.new(:salary, "hello") }.to raise_error ArgumentError
  end
  
  it "initialize set readable value" do
    @condition = CompareCondition.new(:salary, 234)
    @condition.field_name.should == :salary
    @condition.value.should == 234
  end
end