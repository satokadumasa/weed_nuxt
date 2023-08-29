class AdminsController < ApplicationController
  before_action :authenticate_admin!

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
    pp "AdminController.me"
    pp "current_admin:" << current_admin.inspect
    @user = current_admin
    render json: {data: @user}
  end

  # PATCH/PUT /boards/1
  def update
    @user = User.find(params[:id])
    pp "UsersController.update() user:" << @user.inspect
    if @user.update(user_params)
      render json: {user: @user}
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      board = Board.eager_load(:user).find(params[:id])
      @board = board.as_json(:include => :user)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:id, :nickname, :self_introduction)
    end
end
