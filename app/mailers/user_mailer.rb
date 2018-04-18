class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_message.subject
  #
  def new_message user, details
    subject = details[:subject]
    @user = user
    @body = details[:body]
    @sender = details[:sender]

    mail to: "#{@user.email}",
         subject: "[HCS-PTO] #{subject}"
  end
end
