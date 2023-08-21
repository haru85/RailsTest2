class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show, :own]

  def index
    case params[:search]
    when "1" #住所で検索
      @rooms = Room.where("address LIKE?", "#{params[:address]}")
    when "2" #あいまい検索  
      @rooms = Room.merge(Room.where("address LIKE?", "%#{params[:address]}%"))
                    .merge(Room.where("name LIKE?", "%#{params[:keyword]}%").or(Room.where("detail LIKE?", "%#{params[:keyword]}%")))
    end
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :icon, :introduce, :fee, :area, :address, :detail))
    @room.user_id= current_user.id
    @room.icon = "/default_hotel_image.png"
    if @room.save
      if params[:room][:icon]
        image = params[:room][:icon].tempfile.read
        File.binwrite("public/room_images/#{@room.id}.png", image)
        @room.icon = "/room_images/#{@room.id}.png" 
        @room.save     
      end
      flash[:notice] = "登録が完了しました"
      redirect_to "/rooms/own/#{current_user.id}"
    else
      flash.now[:alert] = "登録に失敗しました"
      render "new"
    end   
  end

  def new
    @room = Room.new()
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new()
  end

  def own
    @rooms = Room.where(user_id: params[:id])
  end
end