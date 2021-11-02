module Api
  module V1
    class Api.v1::DoctorsController < ApplicationController
      before_action :authenticate_api_v1_doctor!
      @doctors = Doctor.all
      render json: @doctors

      def create
        @user = get_current_user()
        params[:user_id] = @user.id
    
        @post = Post.create(post_params())
        respond_to_post()
      end
    
      private def post_params
        params.permit(:user_id, :caption, :image)
      end
    
      private def respond_to_post()
        if @post.valid?()
          post_serializer = PostSerializer.new(post: @post, user: @user)
          render json: post_serializer.serialize_new_post()
        else
          render json: { errors: post.errors }, status: 400
        end
      end
    end
  end
end