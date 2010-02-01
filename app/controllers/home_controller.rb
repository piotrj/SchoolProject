class HomeController < ApplicationController
  def index
  	if current_user
			if current_user.first_login
				redirect_to edit_user_path(current_user)
			else
		  	redirect_to school_tests_path
		  end
	  end
	  @user_session = UserSession.new
  end
end
