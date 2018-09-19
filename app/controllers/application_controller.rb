class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  protect_from_forgery with: :null_session

protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
