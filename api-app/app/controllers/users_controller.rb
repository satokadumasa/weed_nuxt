class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    pp "UsersController.index"
    @users = User.all
    render json: @users
  end

  def show
    pp "UsersController.show()"
    pp "params:" << params.inspect
    @user = User.find(params[:id])
    pp "UsersController.show() user:" << @user.inspect
    @followers = @user.followers
    @followings = @user.followings
    render json: {user: @user, followers: @followers, followings: @followings}
  end

  def remove
    follow = Follow.where({followed_id: params['followed_id'], follower_id: params['follower_id']})
    pp "UsersController.follow() follow:" << follow.inspect
    @follow = Follow.find(follow[0].id)
    if @follow.destroy
      render json: {status: 200}
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  def me
    pp "UsersController.me"
    @user = current_user
    render json: {data: @user}
  end
end
