class User < ApplicationRecord
  before_create :set_auth_token
  after_create :user_created_notification
  after_update :password_reset_notification

  has_secure_password

  validates_presence_of :first_name, :last_name
  validates :username,
            presence: true,
            uniqueness: true
  validates :password,
            length: { minimum: 8 }

  def self.activated
    where(is_activated: 1)
  end

  def set_reset_password_token
    self.reset_password_token = generate_reset_password_token
    self.reset_password_token_expires_at = Time.zone.now + 60 * 30
    self.save
  end

private
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end

  def generate_reset_password_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(reset_password_token: token)
    end
  end

  def user_created_notification
    UserMailer.user_created(self).deliver
  end

  def password_reset_notification
    PasswordResetMailer.reset_password_email(self).deliver if self.reset_password_token_changed?
  end
end
