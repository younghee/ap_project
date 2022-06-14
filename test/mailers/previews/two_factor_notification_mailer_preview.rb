# Preview all emails at http://localhost:3000/rails/mailers/two_factor_notification_mailer
class TwoFactorNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/two_factor_notification_mailer/create_notification
  def create_notification
    TwoFactorNotificationMailer.create_notification
  end

end
