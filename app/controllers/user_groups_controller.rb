class UserGroupsController < ApplicationController

  def index
    @user_groups = UserGroup.all
  end

  def new
    @user_group = UserGroup.new
    @group = Group.where(id: params[:group_id]).first
  end

  def create
    group = Group.where(id: params[:group_id]).first
    if params[:group][:passcode].to_i == group.passcode
      @user_group = UserGroup.new
      @user_group.user = current_user
      @user_group.group = group
      if @user_group.save
        redirect_to group_categories_path(group)
      else
        render "new"
      end
    end
  end

end
