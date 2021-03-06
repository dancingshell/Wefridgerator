class SessionsController < ApplicationController

	def index
	end
	def new
		@user = User.new
	end

	def create											#returns user object to access email
		@user = User.where(email: params[:session][:email]).first
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id.to_s
			redirect_to user_path(@user)
		else
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to new_session_path
	end
	
end
