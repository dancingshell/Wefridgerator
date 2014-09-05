class MessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to groups_path
    else 
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:comment)
  end
end
