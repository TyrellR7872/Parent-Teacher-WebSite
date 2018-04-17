class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_message.subject
  #
  def new_message
    @greeting = "Hi!"

    mail to: "ajamil@colgate.edu",
         subject: "test email for software engineering project"
  end
end
