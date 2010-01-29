require File.dirname(__FILE__) + '/../spec_helper'

describe HomeController do
  before do
    @user = Factory(:user)
  end
  
  describe "GET index" do
    it "should be success if user is not logged in" do
      get :index
      response.should be_success
    end
    
    it "should redirect if user is logged in" do
      controller.stub!(:current_user).and_return(@user)
      get :index
      response.should redirect_to(school_tests_path)
    end
  end

end
