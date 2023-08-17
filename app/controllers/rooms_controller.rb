class RoomsController < ApplicationController
  def index
    case params[:search]
    when "0" #登録施設一覧
      @rooms = Room.where(user_id:params[:id])
      render "index"
    when "1" #住所で検索
      @rooms = Room.where("address LIKE?", "%#{params[:address]}%")
    when "2" #あいまい検索  
      @rooms = Room.merge(Room.where("address LIKE?", "%#{params[:address]}%"))
                    .merge(Room.where("name LIKE?", "%#{params[:keyword]}%").or(Room.where("detail LIKE?", "%#{params[:keyword]}%")))
    end
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :icon, :introduce, :fee, :area, :address, :detail))
    @room.user_id= current_user.id
    unless @room.icon
      @room.icon = "/default_hotel_image.png"
    end
    if @room.save
      redirect_to rooms: index,  params:{"id" => current_user.id, "search" => "0"}
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
