class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	@current_user ||= User.where(:id => session[:user_id]).first 
  	#where will refer to an array, while find will refer to one id! This will find an id related to the user who logs in
  	#.first will refer to the id 
  end
end
  