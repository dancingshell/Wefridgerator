class InviteesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @invitee = Invitee.new
  end

  def create
    @group = Group.find(params[:group_id])
    # invitee = @group.invitees.new(params.require(:invitee).permit(:email, :is_member, :user_id))
    emails = params[:email]
    emails.split(" ").each do |invitee_email|
      invitee_email[-1] = "" if invitee_email[-1] == ","
      if User.where(email: invitee_email).count > 0
        Invitee.create!(email: invitee_email, group: @group, is_member: true)
        redirect_to group_path(@group)
      else
        Invitee.create!(email: invitee_email, group: @group, is_member: false)
      end
    end
    
  end

end
