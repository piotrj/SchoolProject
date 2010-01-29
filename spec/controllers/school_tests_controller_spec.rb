require 'spec_helper'

describe SchoolTestsController do
  
  describe "if not logged in" do 
    it "GET index should not allow to access if user is not logged in" do
      lambda { get :index}.should raise_error("Unauthorized access")
    end
    
    it "GET new should not allow to access if user is not logged in" do
      lambda { get :new}.should raise_error("Unauthorized access")
    end
  end

  describe "if logged in" do
    before do
      @user = Factory.create(:user)
      controller.stub!(:current_user).and_return(@user)
    end
    
    describe "GET index" do
      it "should be success" do
        get :index
        response.should be_success
      end
    end
  
    describe "GET new" do
    
      it "should be success" do
        get :new
        response.should be_success
      end
    end
  end
end
