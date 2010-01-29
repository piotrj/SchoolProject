class QuestionsController < ApplicationController
	
	def index
    if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@questions = @category.questions
  	else
  		@questions = Question.all
  	end
  end
  
  def create  	
  	@question=Question.new(params[:question])
  	@question.category=current_category
  	respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to :back }
      else
      	flash[:error] = 'Question was not created.'
        format.html { redirect_to :back }
      end
    end
  end
  
end
