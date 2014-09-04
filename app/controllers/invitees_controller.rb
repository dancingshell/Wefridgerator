class InviteesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @invitee = Invitee.new
    @unsent
  end

  def create
    @group = Group.find(params[:group_id])
    # invitee = @group.invitees.new(params.require(:invitee).permit(:email, :is_member, :user_id))
    emails = params[:email]
    emails_given = []
    emails_sent = []

    emails.split(" ").each do |invitee_email|
      invitee_email[-1] = "" if invitee_email[-1] == ","
      emails_given << invitee_email

      if User.where(email: invitee_email).count > 0
        @invitee = Invitee.create!(email: invitee_email, group: @group, is_member: true)
        emails_sent << @invitee
        UserMailer.join_email(@invitee).deliver
      else
        @invitee = Invitee.create!(email: invitee_email, group: @group, is_member: false)
        emails_sent << @invitee
        UserMailer.signup_email(@invitee).deliver
      end
    end
    redirect_to group_path(@group)
    # @unsent = emails_given - emails_sent
    # if @unsent.count > 0
    #   render 'new'
    # else
    #   
    # end
  end

end
