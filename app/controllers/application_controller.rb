class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :authenticated?

  def current_user
  	return User.find(session[:user_id])
  end

  def logged_in?
  	session[:user_id].present?
  end

  def authenticated?
  	unless logged_in?
  		redirect_to new_user_path
  	end
  end
end
