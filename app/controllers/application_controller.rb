class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user  
  helper :all

  before_filter { |c| Authorization.current_user = c.current_user }

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find  
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  def permission_denied
    redirect_to root_url, :alert => "Sorry, you not allowed to access that page."  
  end
end
