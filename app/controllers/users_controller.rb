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
  
  def show
  	@user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user].merge(:first_login => false))
      flash[:notice] = "Zmiana zakończona pomyślnie."
      redirect_to root_url
    else
      flash[:error] = "Nie udało się wprowadzić zmian."
      render :action => 'edit'
    end
  end

end
