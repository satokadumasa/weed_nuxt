class PageCommentsController < ApplicationController
  before_action :set_page_comment, only: [:show, :update, :destroy]

  # GET /page_comments
  def index
    @page_comments = PageComment.where({page_id: params[:page_id]}).page(params[:page]).per(params[:per]).all

    render json: @page_comments
  end

  # GET /page_comments/1
  def show
    render json: @page_comment
  end

  # POST /page_comments
  def create
    @page_comment = PageComment.new(page_comment_params)

    if @page_comment.save
      render json: @page_comment, status: :created, location: @page_comment
    else
      render json: @page_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /page_comments/1
  def update
    if @page_comment.update(page_comment_params)
      render json: @page_comment
    else
      render json: @page_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /page_comments/1
  def destroy
    @page_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_comment
      @page_comment = PageComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_comment_params
      params.require(:page_comment).permit(:user_id, :page_id, :title, :detail)
    end
end
