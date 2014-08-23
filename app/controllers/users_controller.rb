class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id.to_s
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :zipcode)
  end

end
