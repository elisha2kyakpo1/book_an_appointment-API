module Api
  module V1
    class Api.v1::ClientsController < ApplicationController
      before_action :authenticate_api_v1_client!
      @clients = Client.all
      render json: @clients
    end
  end
end