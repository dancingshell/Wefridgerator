class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create											#returns user object to access email
		@user = User.where(email: params[:user][:email]).first
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id.to_s
			redirect_to user_path(@user)
		else
			redirect_to new_session_path
		end
	end
	
end
