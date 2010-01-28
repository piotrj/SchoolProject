require 'spec_helper'

describe SchoolTestsController do
  
  # #Delete this example and add some real ones
  # it "should use SchoolTestsController" do
  #   controller.should be_an_instance_of(SchoolTestsController)
  # end
  
  before do
    @user = Factory.create(:user)
  end

  describe "GET index" do
    it "should not allow to access if user is not logged in" do
      lambda { get :index}.should raise_error("Unauthorized access")
    end
    
    it "should allow to acces if user is logged in" do
      controller.stub!(:current_user).and_return(@user)
      get :index
      response.should be_success
    end
  end
end
