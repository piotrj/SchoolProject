require 'spec_helper'

describe Questions do
  before(:each) do
    @valid_attributes = {
      :text => "value for text"
    }
  end

  it "should create a new instance given valid attributes" do
    Questions.create!(@valid_attributes)
  end
end
