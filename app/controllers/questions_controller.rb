class QuestionsController < ApplicationController
	
	def index
    if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@questions = @category.questions
  	end
  end
  
  def new
    logger.debug "In new"
    @question = Question.new
    @category = Category.find(params[:category_id])
    @question.category = @category
    
    4.times do
      @question.answers.build
    end
  end
  
  def create  	
  	@question=Question.create(params[:question])
  	respond_to do |format|
      if @question.save
        flash[:notice] = t "flash.question.create.success"
        format.html { redirect_to category_path(@question.category) }
      else
      	flash[:error] = t "flash.question.create.fail"
        format.html { render :action => 'new' }
      end
    end
  end
  
end
