require 'elasticsearch/model'

class Doctor < ApplicationRecord
  include Rails.application.routes.url_helpers
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :appointments
  has_one_attached :image
  has_many :clients, through: :appointments, foreign_key: :client_id, dependent: :destroy, class_name: 'User'

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
  validates :image, {
    presence: true
  }

  def get_image_url
    url_for(image)
  end
end
