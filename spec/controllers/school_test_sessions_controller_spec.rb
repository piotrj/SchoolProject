require 'spec_helper'

describe SchoolTestSessionsController do
  describe "GET new" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST create" do
    before do
      @user_session = mock_model(UserSession)
      SchoolTestSession.stub!(:new => @user_session)
    end
    describe "if name and password correct" do
      before do
        @user_session.stub!(:save => true)
      end
      it "should redirect to new student answer path" do
          @user_session.should_receive(:save)
          post :create
          # response.should redirect_to(new_student_answer_path)
      end
    end
    
    describe "if name or password incorrect" do
      before do
        @user_session.stub!(:save => false)
      end
      
      it "should render new template " do
        @user_session.should_receive(:save)
        post :create
        response.should render_template(:new)
      end
    end
  end
end
