class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /pages
  def index
    pp "params:" << params.inspect
    # @pages = Page.all.where(note_id: params[:note_id]).page(params[:page]).per(params[:per])
    @pages = Page.all.where(note_id: params[:note_id])
    @count = Page.count

    render json: @pages
  end

  # GET /pages/1
  def show
    render json: @page
  end

  # POST /pages
  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id

    if @page.save
      note = Note.find(page_params[:note_id])
      note.page_added_at = Time.now
      if note.save
        render json: @page, status: :created, location: @page
      else
        render json: @page.errors, status: :unprocessable_entity
      end
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      # @page = Page.find(params[:id])
      page = Page.eager_load(:user).find(params[:id])
      @page = page.as_json(:include => :user)
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.permit(:note_id, :title, :overview, :detail)
    end
end
