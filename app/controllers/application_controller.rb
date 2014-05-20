class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :authenticated?
  # helper_method :yelp_token

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

  # def yelp_token
  #   consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://api.yelp.com"})
  #   access_token = OAuth::AccessToken.new(consumer,ENV['TOKEN'], ENV['TOKEN_SECRET'])
  #   return access_token
  # end
end
