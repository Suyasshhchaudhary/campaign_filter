class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def filter
    campaign_names = params[:campaign_names].split(',')
    @users = User.filter_users_by_campaign_names(campaign_names)
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [])
  end
end
