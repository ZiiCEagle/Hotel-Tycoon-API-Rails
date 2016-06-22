class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :birthdate, :phone
  validates :phone,
            presence: true,
            numericality: true

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
