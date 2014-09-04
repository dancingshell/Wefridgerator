class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.join_email.subject
  #
  def join_email(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: ""
  end
end
