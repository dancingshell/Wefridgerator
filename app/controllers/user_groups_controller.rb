class UserGroupsController < ApplicationController


  def new
    @user_group = UserGroup.new
    @group = Group.where(id: params[:group_id]).first
  end

  def create
    group = Group.where(id: params[:group_id]).first
    if params[:group][:passcode].to_i == group.passcode
      redirect_to groups_path
    end
  end

end
