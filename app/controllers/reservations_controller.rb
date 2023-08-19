class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :confirm]

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

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :people, :user_id, :room_id))
    @room = @reservation.room
    if @reservation.checkin.blank? || @reservation.checkout.blank? || @reservation.people.blank?
      puts "blank"
      redirect_to @reservation.room
    elsif @reservation.checkin < Date.today || @reservation.checkin > @reservation.checkout
      puts "checkout"
      redirect_to @reservation.room
    elsif !@reservation.people.is_a?(Integer) || @reservation.people == 0
      puts "people"
      redirect_to @reservation.room
    end
  end  
end
