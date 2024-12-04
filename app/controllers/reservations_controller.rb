class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @ninja = Ninja.find(params[:ninja_id])
    @reservation.ninja = @ninja
    @reservation.user = current_user
    if @reservation.save!
      redirect_to ninjas_path, notice: "Votre réservation a bien été enregistrée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :reservation_id, :user_id)
  end
end
