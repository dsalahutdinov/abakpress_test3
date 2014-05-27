require 'spec_helper'

describe Condition do
  before(:each) do
    @condition = Condition.new
  end

  it "to_s should raise exception" do
    expect { @condition.to_s }.to raise_error(NotImplementedError)
  end
end