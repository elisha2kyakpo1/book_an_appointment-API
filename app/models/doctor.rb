class Doctor < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many :appointments
  has_one_attached :image
  has_many :clients, through: :appointments, foreign_key: :client_id, dependent: :destroy, class_name: 'User'

  validates :image, {
    presence: true
  }
  
  def get_image_url
    url_for(self.image)
  end
end
