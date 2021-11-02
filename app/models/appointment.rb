class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :client, class_name: 'User'
end
