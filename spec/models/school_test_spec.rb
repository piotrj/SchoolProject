require 'spec_helper'
require "authlogic/test_case"

describe SchoolTest do
  it "should create a new instance given valid attributes" do
    Factory(:school_test).valid?.should be_true
  end
  
  describe "sessions management" do
    before do
      activate_authlogic
    end

    it "should not create a session on creation" do
      Factory(:school_test)
      SchoolTest.find(:all).count.should == 1
      SchoolTestSession.find.should be_nil
    end
  end
end
