class StudentAnswersController < ApplicationController
  before_filter :student_logged_in, :except => [:show, :index]
  before_filter :require_user, :only => [:show, :index]

  def new
    @answer = StudentAnswer.new
    @answer.school_test = current_test
    @answer.ip = request.remote_ip
  end
  
  def create
    @answer = StudentAnswer.new(params[:student_answer])
    if @answer.save
      flash[:notice] = t "flash.student_answer.create.success"
      redirect_to edit_student_answer_path(:current)
      flash[:answer_id] = @answer.id
    else 
      flash[:error] = t "flash.student_answer.create.fail"
      render :action => :new
    end
  end
  
  def edit
    @answer = StudentAnswer.find(flash[:answer_id])
    @answer.build_questions
    flash[:submit_answer_id] = @answer.id
  end
  
  def update
    @answer = StudentAnswer.find(flash[:submit_answer_id])
    if @answer.update_attributes(params[:student_answer])
      flash[:notice] = "Pomyślnie zapisano odpowiedzi"
    else
      flash[:error] = "Wystąpił błąd przy zapisywaniu odpowiedzi"
    end
    current_test_session.destroy
    redirect_to root_url
  end
  
  def index
    @test = SchoolTest.find(params[:school_test_id])
    @answers = @test.student_answers
  end
  
  def show
    @answer = StudentAnswer.find(params[:id])
  end
  
  private 
    def student_logged_in
      send_unauthorized if current_test.nil?
    end
end
