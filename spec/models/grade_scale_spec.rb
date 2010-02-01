require 'spec_helper'

describe GradeScale do
  before(:each) do
    @valid_attributes = {
      :five => 9.99,
      :four_and_half => 9.99,
      :four => 9.99,
      :three_and_half => 9.99,
      :three => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    GradeScale.create!(@valid_attributes)
  end
end
