# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :set_locale

  helper_method :current_user

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  private
  def set_locale
    I18n.locale = "pl"
  end
  
  def require_user
    send_unauthorized if current_user.nil?
  end
  
  def require_owner
    model =  controller_name.singularize.camelize.constantize
    send_unauthorized("Object is not owned by current user") unless (model.find(params[:id]).owned_by?(current_user) || current_user.admin?)
  end
  
  def require_admin_to_see_others
    send_unauthorized unless (params[:user_id].nil? or current_user.admin?)
  end

  def send_unauthorized(message = "Unauthorized access")
    #TODO: create custom Exception for unauthorized access
    raise message
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def current_test_session
    return @current_test_session if defined?(@current_test_session)
    @current_test_session = SchoolTestSession.find
  end

  def current_test
    return @current_test if defined?(@current_test)
    @current_test = current_test_session && current_test_session.record
  end
end
