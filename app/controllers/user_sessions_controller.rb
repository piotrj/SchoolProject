class UserSessionsController < ApplicationController
    def new
      @user_session = UserSession.new
    end
    
    def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = t "flash.login.success"
        redirect_to root_url
      else
        flash[:error] = t "flash.login.fail"
        
        render :action => 'new'
      end
    end
    
    def destroy
      @user_session = UserSession.find(params[:id])
      @user_session.destroy
      flash[:notice] = t "flash.logout.success"
      redirect_to root_url
    end
end
