class BoardCommentsController < ApplicationController
  before_action :set_board_comment, only: [:show, :update, :destroy]
  # GET /board_comments
  def index
    # pp "index board_comment_params:" << board_comment_params.inspect
    # @board_comments = BoardComment.where(board_id: board_comment_params[:board_id]).all
    # @board = @board_comments[1]
    board_comments = BoardComment.eager_load(:user).where(board_id: params[:board_id]).all
    @board_comments = board_comments.as_json(:include => :user)
    render json: @board_comments
  end

  # GET /board_comments/1
  def show
    render json: @board_comment
  end

  # POST /board_comments
  def create
    @board_comment = BoardComment.new(board_comment_params)
    @board_comment.user_id = current_user.id

    if @board_comment.save
      board = Board.find(board_comment_params[:board_id])
      board.comment_added_at = Time.now
      if board.save
        render json: @board_comment, status: :created, location: @board_comment
      else
        render json: @board_comment.errors, status: :unprocessable_entity
      end
    else
      render json: @board_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /board_comments/1
  def update
    if @board_comment.update(board_comment_params)
      render json: @board_comment
    else
      render json: @board_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /board_comments/1
  def destroy
    @board_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_comment
      # @board_comment = BoardComment.find(params[:id])
      board_comment = BoardComment.eager_load(:user).find(params[:id])
      @board_comment = board_comment.as_json(:include => :user)
    end

    # Only allow a list of trusted parameters through.
    def board_comment_params
      params.permit(:board_id, :title, :detail)
    end

end
