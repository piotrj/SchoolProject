class UsersController < ApplicationController

	def index
		@users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    if User.create_teacher(params[:user][:email])
      flash[:notice] = "Użytkownik utworzony pomyślnie."
      redirect_to root_url
    else
    	flash[:error] = "Nie udało się utworzyć użytkownika."
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

end
