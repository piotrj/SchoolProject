class SchoolTestsController < ApplicationController
	before_filter :require_user
	
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
    Category.for_user(current_user).each do |category|
      @test.test_categories.build(:category => category, :school_test => @test)
    end
    
    logger.debug @test.test_categories.inspect
  end
  
  def create  	
  	@test=SchoolTest.new(params[:school_test])
  	@test.user=current_user
  	respond_to do |format|
      if @test.save
        flash[:notice] = 'Test was successfully created.'
        format.html { redirect_to school_tests_path }
      else
      	flash[:error] = 'Test was not created.'
        format.html { render :action => "new"}
      end
    end
  end
  
  def edit
    @test = SchoolTest.find(params[:id])
  end
  
  def update
    @test = SchoolTest.find(params[:id])
    respond_to do |format|
      if @test.update_attributes(params[:school_test])
        flash[:notice] = 'Test was successfully updated.'
        format.html { redirect_to school_tests_path }
      else
      	flash[:error] = 'Test was not updated.'
        format.html { render :action => "edit"}
      end
    end
  end

end
