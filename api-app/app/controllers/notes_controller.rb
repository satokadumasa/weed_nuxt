class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    pp "NotesController::index()"
    pp "NotesController::index() note_params:" << note_params.inspect
    per = note_params[:per] != nil ? note_params[:per].to_i : 10
    page = note_params[:page] != nil ? note_params[:page].to_i : 1
    keyword = note_params[:keyword] != nil ? note_params[:keyword] : nil
    pp "NotesController::index() per[#{per}] page[#{page}] keyword[#{keyword}]"
    @notes = []
    if keyword
      pp "Note serch"
      @notes = Note.all.order(id: "DESC").where("title LIKE ?", "%#{keyword}%").or(Note.where("overview LIKE ?", "%#{keyword}%")).or(Note.where("detail LIKE ?", "%#{keyword}%")).page(page).per(per)
    else
      pp "Note non serch"
      @notes = Note.all.order(id: "DESC").page(params[:page]).per(params[:per])
    end
    @count = @notes.count
    pp "NotesController::index() count[#{@count}]"
    page_num = @count / per
    @max_page = page_num * per < @count ? page_num + 1 : page_num
    render json: {notes: @notes, count: @count, max_page: @max_page}
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
      render json: @note, status: :created
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
      params.permit(:title, :overview, :detail, :keyword)
    end
end
