require 'spec_helper'

describe FieldCondition do
  it "create instance with string or symbol field_name should pass" do
    expect { FieldCondition.new("first_name") }.not_to raise_error
    expect { FieldCondition.new(:first_name) }.not_to raise_error
  end
  
  it "create instance with incorrect field_name should fail" do
    expect { FieldCondition.new("") }.to raise_error ArgumentError
    expect { FieldCondition.new(1) }.to raise_error ArgumentError
    expect { FieldCondition.new(nil) }.to raise_error ArgumentError
  end
  
  it "field_name should be set with initialize" do
    c = FieldCondition.new("field_name")
    c.field_name.should == :field_name
  end
  
  it "to_s should raise error" do
    c = FieldCondition.new("field_name")
    expect { c.to_s }.to raise_error NotImplementedError
  end
end