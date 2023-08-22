class WhispersController < ApplicationController
  before_action :set_whisper, only: [:show, :update, :destroy]

  # GET /whispers
  def index
    @whispers = Whisper.all

    render json: @whispers
  end

  # GET /whispers/1
  def show
    render json: @whisper
  end

  # POST /whispers
  def create
    @whisper = Whisper.new(whisper_params)

    if @whisper.save
      render json: @whisper, status: :created, location: @whisper
    else
      render json: @whisper.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /whispers/1
  def update
    if @whisper.update(whisper_params)
      render json: @whisper
    else
      render json: @whisper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /whispers/1
  def destroy
    @whisper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whisper
      @whisper = Whisper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def whisper_params
      params.require(:whisper).permit(:user_id, :room_id, :body)
    end
end
