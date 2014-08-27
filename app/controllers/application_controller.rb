class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_group

  def current_user
  	@current_user ||= User.where(:id => session[:user_id]).first 
  	#where will refer to an array, while find will refer to one id! This will find an id related to the user who logs in
  	#.first will refer to the id 
  end

  def current_group
    #Find all the user groups of the current_user
    user_groups = UserGroup.where(user_id: current_user.id.to_s)
    #Create an array of all the group_ids for those user_groups
    groups = user_groups.map(&:group_id)
    #Find the groups associated with those user_groups
    Group.where(id: groups)
  end
end
  