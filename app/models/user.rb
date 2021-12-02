require 'elasticsearch/model'

class User < ApplicationRecord
  has_secure_password

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :appointments
  has_many :doctors, through: :appointments, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
end
