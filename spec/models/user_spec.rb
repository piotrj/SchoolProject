require File.dirname(__FILE__) + '/../spec_helper'
describe User do
  describe "when creating" do
    it "should create new instance given valid attributes" do
      Factory(:user).valid?.should be_true
    end
  end
end
