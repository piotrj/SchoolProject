class QuestionsController < ResourceAccessController
	def index
    if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@questions = @category.questions
  	end
  end
  
  def new
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
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = t "flash.question.update.success"
        format.html { redirect_to question_path }
      else
      	flash[:error] = t "flash.question.update.fail"
        format.html { render :action => "edit"}
      end
    end
  end
  
  def show
    @question = Question.find(params[:id])
  end
end
