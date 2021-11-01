module Api
  module V1
    class Api.v1::DoctorsController < ApplicationController
      before_action :authenticate_api_v1_doctor!
      @doctors = Doctor.all
      render json: @doctors
    end
  end
end