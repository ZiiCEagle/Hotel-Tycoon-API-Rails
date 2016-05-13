class User < ApplicationRecord
  before_create :set_auth_token
  has_secure_password

  validates_presence_of :first_name, :last_name
  validates :username,
            presence: true,
            uniqueness: true

  def self.activated
    where(is_activated: 1)
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
end
