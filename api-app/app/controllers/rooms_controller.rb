class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    # @rooms = Room.all
    # render json: @rooms
    pp room_params.inspect
    per = room_params[:per] != nil ? room_params[:per].to_i : 10
    page = room_params[:page] != nil ? room_params[:page].to_i : 1
    logger.debug "per[#{room_params[:per]}] psgr[#{room_params[:page]}]"
    @rooms = Room.all.order(id: "DESC").page(page).per(per)
    @count = Room.count
    page_num = @count / per
    @max_page = page_num * per < @count ? page_num + 1 : page_num
    render json: {rooms: @rooms, count: @count, max_page: @max_page}
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.permit(:name, :user_id, :overview)
    end
end
