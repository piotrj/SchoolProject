class QuestionsController < ApplicationController
	
	def index
    if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@questions = @category.questions
  	end
  end
  
  def new
    @question = Question.new
    @category = Category.find(params[:category_id])
  end
  
  def create  	
  	@question=Question.create(params[:question])
  	@question.category = Category.find(params[:category_id])
  	respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to category_path(@question.category) }
      else
      	flash[:error] = 'Question was not created.'
        format.html { render :action => 'new' }
      end
    end
  end
  
end
