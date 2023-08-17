class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :icon, :introduce, :fee, :area, :address, :detail))
    @room.user_id= current_user.id
    unless @room.icon
      @room.icon = "/default_hotel_image.png"
    end
    if @room.save
      redirect_to :rooms, params:{"user_id" => "current_user.id"}
    else
      render "new"
    end
  end

  def new
    @room = Room.new()
  end

  def show
    @room = Room.find(params[:id])
  end
end
