module Api
  module V1
    class Api.v1::AppointmentsController < ApplicationController
      @appointments = Appointment.all
      render json: @appointments
    end
  end
end