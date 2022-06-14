class TwoFactorNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.two_factor_notification_mailer.create_notification.subject
  #
  def create_notification(email, code)

    #@current_user = current_user
    @code = code
    @email = email
    @greeting = "Hi"

    mail to: @current_user , subject: 'test'
  end
end
