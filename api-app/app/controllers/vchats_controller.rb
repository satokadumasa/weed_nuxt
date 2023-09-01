class VchatsController < ApplicationController
  before_action :set_vchat, only: %i[ show update destroy ]

  # GET /vchats
  def index
    @vchats = Vchat.all

    render json: @vchats
  end

  # GET /vchats/1
  def show
    render json: @vchat
  end

  # POST /vchats
  def create
    @vchat = Vchat.new(vchat_params)

    if @vchat.save
      render json: @vchat, status: :created, location: @vchat
    else
      render json: @vchat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vchats/1
  def update
    if @vchat.update(vchat_params)
      render json: @vchat
    else
      render json: @vchat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vchats/1
  def destroy
    @vchat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vchat
      @vchat = Vchat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vchat_params
      params.require(:vchat).permit(:name, :user_id, :orverview)
    end
end
