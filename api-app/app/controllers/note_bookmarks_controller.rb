class NoteBookmarksController < ApplicationController
  before_action :set_note_bookmark, only: [:show, :update, :destroy]

  # GET /note_bookmarks
  def index
    @note_bookmarks = NoteBookmark.all

    render json: @note_bookmarks
  end

  # GET /note_bookmarks/1
  def show
    render json: @note_bookmark
  end

  # POST /note_bookmarks
  def create
    @note_bookmark = NoteBookmark.new(note_bookmark_params)

    if @note_bookmark.save
      render json: @note_bookmark, status: :created, location: @note_bookmark
    else
      render json: @note_bookmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /note_bookmarks/1
  def update
    if @note_bookmark.update(note_bookmark_params)
      render json: @note_bookmark
    else
      render json: @note_bookmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /note_bookmarks/1
  def destroy
    @note_bookmark.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note_bookmark
      @note_bookmark = NoteBookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_bookmark_params
      params.permit(:note_id, :user_id)
    end
end
