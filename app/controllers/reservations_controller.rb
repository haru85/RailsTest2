class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
    @reservations = Reservation.where(user_id:params[:id])
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :people, :user_id, :room_id))
    if @reservation.save
      redirect_to reservations: index,  params:{"id" => current_user.id}
    else
      render "rooms/show"
    end
  end

end
