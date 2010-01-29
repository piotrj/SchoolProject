require 'spec_helper'

describe SchoolTestsController do
  
  describe "if not logged in" do 
    it "GET index should not allow to access" do
      lambda { get :index}.should raise_error("Unauthorized access")
    end
    
    it "GET new should not allow to access" do
      lambda { get :new}.should raise_error("Unauthorized access")
    end
    
    it "POST create should not allow to access" do
      lambda {post :create}.should raise_error("Unauthorized access")
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
    
    describe "POST create" do
      before do
        @test = mock_model(SchoolTest)
      end
      describe "if save successed" do
        before do
          @test.stub!(:save).and_return(true)
        end
        it "should redirect to tests listing" do
          post :create 
          response.should redirect_to(school_tests_path)
        end
      end
    end
  end
end
