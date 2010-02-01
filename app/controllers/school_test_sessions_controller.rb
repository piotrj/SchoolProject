class SchoolTestSessionsController < ApplicationController
  def new
    @test_session = SchoolTestSession.new
  end 
  
  def create
    @test_session = SchoolTestSession.new(params[:school_test_session])
    if @test_session.save
      flash[:notice] = t("flash.test_login.success")
      redirect_to new_student_answer_path
    else
      flash[:notice] = t("flash.test_login.fail")
      render :action => :new
    end
  end
end
