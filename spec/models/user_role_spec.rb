require 'spec_helper'

describe UserRole do
  describe "when creating" do
    it "should create new instance given valid attributes" do
      Factory(:user_role).valid?.should be_true
    end
  end
end
