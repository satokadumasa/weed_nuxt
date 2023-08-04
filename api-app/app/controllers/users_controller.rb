class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    pp "UsersController.index"
    @users = User.all
    render json: @users
  end

  def show
    pp "UsersController.show"
    @user = User.find(params[:id])
    render json: @user
  end

  def me
    pp "UsersController.me"
    @user = current_user
    render json: {data: @user}
  end
end
