require 'spec_helper'

describe Answer do
  before(:each) do
    @valid_attributes = {
      :text => "value for text",
      :correct => false
    }
  end

  it "should create a new instance given valid attributes" do
    Answer.create!(@valid_attributes)
  end
end
