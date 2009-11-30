class TestsController < ApplicationController
	
	def index
		if params[:user_id]
  		@user = User.find(params[:user_id])
  		@tests = @user.tests
  	else
  		@tests = Test.all
  	end
  end
	
	def new
    @test = Test.new
  end
  
  def create  	
  	@test=Test.new(params[:test])
  	@test.user=current_user
  	respond_to do |format|
      if @test.save
        flash[:notice] = 'Test was successfully created.'
        format.html { redirect_to root_url }
      else
      	flash[:error] = 'Test was not created.'
        format.html { redirect_to root_url }
      end
    end
  end
end
