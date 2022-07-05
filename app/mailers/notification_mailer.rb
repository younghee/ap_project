class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.create_notification.subject
  #
  def create_notification(email, code)

    @greeting = "Hi"
    @email = email
    @code = code
    mail to: email , subject: 'test'
  end

end
