class UserMailer < ActionMailer::Base
  default from: "invite@wefridgerator.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.join_email.subject
  #
  def join_email(invitee)
    @invitee = invitee
    @group = Group.where(:id => @invitee.group).first
    @owner = User.where(:id => @group.owner).first

    mail to: @invitee.email, subject: "#{@owner.first_nameGarG} invited you to join their Wefridgerator group!"
  end

  def signup_email(invitee)
    @invitee = invitee
    @group = Group.where(:id => @invitee.group).first
    @owner = User.where(:id => @group.owner).first
     
    mail to: @invitee.email, subject: "#{@owner.first_name} invited you to join their Wefridgerator group!"
  end
end
