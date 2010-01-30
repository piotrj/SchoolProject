class CategoriesController < ApplicationController
	before_filter :require_user, :only => [:new, :create, :index]
	before_filter :require_owner, :only => [:edit, :update]
	def index
    if params[:user_id]
  		@user = User.find(params[:user_id])
  		@categories = @user.categories
  	else
  		@categories = Category.all
  	end
  end
	
	def new
    @category = Category.new
  end
  
  def create  	
  	@category=Category.new(params[:category])
  	@category.user=current_user
  	respond_to do |format|
      if @category.save
        flash[:notice] = t "flash.category.create.success"
        format.html { redirect_to categories_path }
      else
      	flash[:error] = t "flash.category.create.fail"
        format.html { redirect_to url_for categories_path }
      end
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
  	respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = t "flash.category.update.success"
        format.html { redirect_to category_path(@category) }
      else
      	flash[:error] = t "flash.category.update.fail"
        format.html { redirect_to url_for category_path(@category) }
      end
    end
  end
end
