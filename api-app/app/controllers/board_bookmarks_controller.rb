class BoardBookmarksController < ApplicationController
  before_action :set_board_bookmark, only: [:show, :update, :destroy]

  # GET /board_bookmarks
  def index
    @board_bookmarks = BoardBookmark.all

    render json: @board_bookmarks
  end

  # GET /board_bookmarks/1
  def show
    render json: @board_bookmark
  end

  # POST /board_bookmarks
  def create
    @board_bookmark = BoardBookmark.new(board_bookmark_params)

    if @board_bookmark.save
      render json: @board_bookmark, status: :created, location: @board_bookmark
    else
      render json: @board_bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /board_bookmarks/1
  def update
    if @board_bookmark.update(board_bookmark_params)
      render json: @board_bookmark
    else
      render json: @board_bookmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /board_bookmarks/1
  def destroy
    @board_bookmark.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_bookmark
      @board_bookmark = BoardBookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_bookmark_params
      pp "board_bookmark_params() params:" << params.inspect
      params.permit(:board_id, :user_id)
    end
end
