class VchatsController < ApplicationController
  before_action :set_vchat, only: %i[ show update destroy ]

  # GET /vchats
  def index
    pp vchat_params.inspect
    per = vchat_params[:per] != nil ? vchat_params[:per].to_i : 10
    page = vchat_params[:page] != nil ? vchat_params[:page].to_i : 1
    logger.debug "per[#{vchat_params[:per]}] psgr[#{vchat_params[:page]}]"
    @vchats = Vchat.all.order(id: "DESC").page(page).per(per)
    @count = Vchat.count
    page_num = @count / per
    @max_page = page_num * per < @count ? page_num + 1 : page_num
    render json: {vchats: @vchats, count: @count, max_page: @max_page}
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
      params.permit(:name, :user_id, :orverview)
    end
end
