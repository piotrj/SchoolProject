require 'spec_helper'

describe SchoolTest do
  it "should create a new instance given valid attributes" do
    Factory(:school_test).valid?.should be_true
  end
end
