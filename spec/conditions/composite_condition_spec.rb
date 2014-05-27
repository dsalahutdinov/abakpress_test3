require 'spec_helper'

describe CompositeCondition do
  it "create instance with conditions pass" do
    c1 = GreaterCondition.new(:salary, 1)
    c2 = LessCondition.new(:salary, 1)
    c3 = EqualCondition.new(:salary, 1)
    expect { @condition = CompositeCondition.new(c1, c2) }.not_to raise_error
    expect { @condition = CompositeCondition.new(c1, c2, c2) }.not_to raise_error
  end
  
  it "incorrect parameters in initialize fails" do
    expect { @condition = CompositeCondition.new([]) }.to raise_error
    expect { @condition = CompositeCondition.new([1, 2]) }.to raise_error
    expect { @condition = CompositeCondition.new(2, 4) }.to raise_error
    expect { @condition = CompositeCondition.new("sdfsd") }.to raise_error
  end
end