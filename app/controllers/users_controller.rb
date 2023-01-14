class UsersController < ApplicationController
    before_action :authenticate_user!
  
    # GET /topics
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /topics/1
    def show
        @user = User.find(params[:id])
      render json: @user
    end

  end
  