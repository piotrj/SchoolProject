class HomeController < ApplicationController
  def index
    redirect_to school_tests_path if current_user
    @user_session = UserSession.new
  end
end
