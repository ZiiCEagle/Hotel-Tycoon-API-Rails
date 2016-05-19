class User < ApplicationRecord
  has_and_belongs_to_many :roles

  before_create :set_auth_token
  after_create :user_created_notification
  before_save :password_reset_notification, if: "reset_password_token_changed?", unless: "reset_password_token.nil?"

  has_secure_password

  validates_presence_of :first_name, :last_name, :email
  validates :password,
            length: { minimum: 8 },
            if: "password.present?",
            unless: :reset_password_token_changed? # Si le reset password token ne change pas
  validates :username,
            presence: true,
            uniqueness: true

  def self.activated
    where(is_activated: 1)
  end

  def set_reset_password_token
    self.reset_password_token = generate_reset_password_token
    self.reset_password_token_expires_at = Time.zone.now + 60 * 30
    self.save
  end

  def as_json(options = {})
    super(options.merge({ except: [:password_digest, :created_at, :updated_at, :reset_password_token, :reset_password_token_expires_at] }))
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
    PasswordResetMailer.reset_password_email(self).deliver
  end
end
