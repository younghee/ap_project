class User < ApplicationRecord
  serialize :otp_backup_codes, JSON
  devise :two_factor_authenticatable, :two_factor_backupable,
         :otp_secret_encryption_key => ENV['OPT_KEY'] || SecureRandom.hex(16)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable

         attr_accessor :otp_plain_backup_codes

         # Generate an OTP secret it it does not already exist
   
        def generate_two_factor_secret_if_missing!
          return unless otp_secret.nil?
          update!(otp_secret: User.generate_otp_secret)
          current_otp
          TwoFactorNotificationMailer.create_notification(email, current_otp).deliver_now
        end

        # Ensure that the user is prompted for their OTP when they login
        def enable_two_factor!
          update!(otp_required_for_login: true)
        end

        # Disable the use of OTP-based two-factor.
        def disable_two_factor!
          update!(
              otp_required_for_login: false,
              otp_secret: nil,
              otp_backup_codes: nil)
        end

        # URI for OTP two-factor QR code
        def two_factor_qr_code_uri
          issuer = ENV['OTP_2FA_ISSUER_NAME']
          label = [issuer, email].join(':')

          otp_provisioning_uri(label, issuer: issuer)
          #otp_provisioning_uri(email)
        end

        # Determine if backup codes have been generated
        def two_factor_backup_codes_generated?
          otp_backup_codes.present?
        end

end
