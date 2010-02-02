class StudentAnswersController < ApplicationController
  before_filter :student_logged_in

  def new
    @answer = StudentAnswer.new
    @answer.school_test = current_test
    @answer.ip = request.remote_ip
  end
  
  def create
    @answer = StudentAnswer.new(params[:student_answer])
    if @answer.save
      flash[:notice] = t "flash.student_answer.create.success"
      redirect_to edit_student_answer_path(@answer)
      current.
    else 
      flash[:error] = t "flash.student_answer.create.fail"
      render :action => :new
    end
  end
  
  private 
    def student_logged_in
      send_unauthorized if current_test.nil?
    end
end
