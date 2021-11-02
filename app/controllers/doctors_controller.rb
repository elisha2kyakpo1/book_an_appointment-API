class DoctorsController < ApplicationController
  before_action :authenticate_api_v1_doctor!

  def create
    @user = get_current_user()
    params[:user_id] = @user.id

    @doctor = Doctor.create(post_params())
    respond_to_post()
  end

  private def doctor_params
    params.permit(:client_id, :name, :email, :image)
  end

  private def respond_to_doctor()
    if @doctor.valid?()
      doctor_serializer = PostSerializer.new(doctor: @doctor, user: @user)
      render json: doctor_serializer.serialize_new_doctor()
    else
      render json: { errors: doctor.errors }, status: 400
    end
  end
end