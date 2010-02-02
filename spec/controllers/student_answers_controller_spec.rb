require 'spec_helper'

describe StudentAnswersController do
  describe "GET new" do
    before do
      @test = Factory(:school_test)
    end
    it "should be success if student is logged to the test" do
      controller.stub!(:current_test => @test)
      get :new
      response.should render_template(:new)
    end
    
    it "should fail if student is not logged in" do
      controller.stub!(:current_test => nil)
      lambda{get :new}.should raise_error
    end
  end
  
  describe "POST create" do
    before do
      @test = Factory(:school_test)
      @student_answer = mock_model(StudentAnswer)
      StudentAnswer.stub!(:new => @student_answer)
    end
    
    it "should be success if student is logged to the test" do
      controller.stub!(:current_test => @test)
      @student_answer.should_receive(:save).and_return(true)
      post :create
      response.should redirect_to(edit_student_answer_path(@student_answer))
    end
    
    it "should fail if student is not logged in" do
      controller.stub!(:current_test => nil)
      lambda{post :create}.should raise_error
    end
    
    it "should render template if answer data is invalid" do
      controller.stub!(:current_test => @test)
      @student_answer.should_receive(:save).and_return(false)
      post :create
      response.should render_template(:new)
    end
  end
end
