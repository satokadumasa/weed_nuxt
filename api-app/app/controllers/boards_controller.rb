class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    pp "BoardsController::index()"
    pp "index() board_params:" << board_params.inspect
    per = board_params[:per] != nil ? board_params[:per].to_i : 10
    page = board_params[:page] != nil ? board_params[:page].to_i : 1
    keyword = board_params[:keyword] != nil ? board_params[:keyword] : nil
    pp "BoardsController::index() per[#{per}] page[#{page}] keyword[#{keyword}]"
    @boards = []
    if keyword
      pp "BoardsController::index() keyword is not nil"
      @boards = Board.all.order(id: "DESC").where("title LIKE ?", "%#{keyword}%").or(Board.where("detail LIKE ?", "%#{keyword}%")).page(page).per(per)
    else
      pp "BoardsController::index() keyword is nill"
      @boards = Board.all.order(id: "DESC").page(page).per(per)
    end
    @count = Board.count
    page_num = @count / per
    @max_page = page_num * per < @count ? page_num + 1 : page_num
    render json: {boards: @boards, count: @count, max_page: @max_page}
  end

  # GET /boards/1
  def show
    pp board_params.inspect
    board_comments = BoardComment.eager_load(:user).where(board_id: params[:id]).all
    @board_comments = board_comments.as_json(:include => :user)
    render json: {board: @board, board_comments: @board_comments}
  end

  # POST /boards
  def create
    pp "board_params:" << board_params.inspect
    @board = Board.new(board_params)
    @board.comment_added_at = Time.now
    @board.user_id = current_user.id

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    @board = Board.eager_load(:user, {board_comments: :user}).find(params[:id])
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      board = Board.eager_load(:user).find(params[:id])
      @board = board.as_json(:include => :user)
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.permit(:title, :detail, :per, :page, :keyword)
    end
end
