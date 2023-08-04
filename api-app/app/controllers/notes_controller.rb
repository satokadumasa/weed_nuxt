class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all.order(id: "DESC").page(params[:page]).per(params[:per])
    @count = Note.count
    render json: {notes: @notes, count: @count}
  end

  # GET /notes/1
  def show
    pages = Page.eager_load(:user).where(note_id: params[:id]).all
    @pages = pages.as_json(:include => :user)
    render json: {note: @note, pages: @pages}
  end

  # POST /notes
  def create
    @note = Note.new(note_params)
    @note.page_added_at = Time.now
    @note.user_id = current_user.id

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      note = Note.eager_load(:user).find(params[:id])
      @note = note.as_json(:include => :user)
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.permit(:title, :overview, :detail)
    end
end
