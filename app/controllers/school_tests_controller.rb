class SchoolTestsController < ResourceAccessController
  
  def index
    if params[:user_id]
	    @user = User.find(params[:user_id])
  	else 
  	  @user = current_user
  	end
  	@tests = @user.school_tests
  end
  
  def show
    @test = SchoolTest.find(params[:id])
    logger.debug @test.test_categories.inspect
  end
	
	def new
    @test = SchoolTest.new
    @test.build_grade_scale
    @categories = current_user.categories
  end
  
  def create  	
  	@test=SchoolTest.new(params[:school_test])
  	@test.user=current_user
  	@categories = current_user.categories
  	respond_to do |format|
      if @test.save
        flash[:notice] = t "flash.test.create.success"
        format.html { redirect_to school_tests_path }
      else
      	flash[:error] = t "flash.test.create.fail"
        format.html { render :action => "new"}
      end
    end
  end
  
  def edit
    @test = SchoolTest.find(params[:id])
    @categories = @test.user.categories
  end
  
  def update
    @test = SchoolTest.find(params[:id])
    @categories = current_user.categories
    respond_to do |format|
      if @test.update_attributes(params[:school_test])
        flash[:notice] = t "flash.test.update.success"
        format.html { redirect_to school_tests_path }
      else
      	flash[:error] = t "flash.test.update.fail"
        format.html { render :action => "edit"}
      end
    end
  end
  
  def destroy
  	@test = SchoolTest.find(params[:id])
    @test.destroy
    flash[:notice] = "Test usunięty pomyślnie"
    if params[:user_id]
    	redirect_to user_school_tests_path(params[:user_id])
    else
    	redirect_to school_tests_path
    end
  end

  # def add_category
  #   @category
  # end
end
