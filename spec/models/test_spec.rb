require 'spec_helper'

describe Test do
  before(:each) do
    @valid_attributes = {
      :Name => "value for Name",
      :OwnerID => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Test.create!(@valid_attributes)
  end
end
