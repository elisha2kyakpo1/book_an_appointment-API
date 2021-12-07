module Api
  module V1
    class Api::V1::DoctorsController < ApplicationController
      def index
        @doctors = Doctor.all
        render json: @doctors
      end

      def create
        @user = get_current_user
        params[:user_id] = @user.id

        image = Cloudinary::Uploader.upload(params[:image])
        @doctor = Doctor.create!(name: params[:name], email: params[:email], phone: params[:phone], about: params[:about],
                                 image: image['url'])
        respond_to_doctor
      end

      private def doctor_params
        params.permit(:client_id, :name, :email, :image)
      end

      private def respond_to_doctor()
        if @doctor.valid?
          doctor_serializer = DoctorSerializer.new(doctor: @doctor, user: @user)
          render json: doctor_serializer.serialize_new_doctor
        else
          render json: { errors: doctor.errors }, status: 400
        end
      end
    end
  end
end
