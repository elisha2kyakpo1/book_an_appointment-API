class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :doctors, through: :appointments, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
end
