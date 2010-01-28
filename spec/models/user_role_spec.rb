require 'spec_helper'

describe UserRole do
  describe "when creating" do
    it "should create new instance given valid attributes" do
      Factory(:user_role).valid?.should be_true
    end
  end
  
  describe "when no email given" do
    before do
      @user = Factory.build(:user, :email => nil)
    end
    
    it "should not be valid" do
      @user.should_not be_valid
    end
    
    it "should add error to name on save attempt" do
      @user.save
      @user.errors.on(:email).should_not be_blank
    end
  end
end
