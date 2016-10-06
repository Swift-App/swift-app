class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:job_id, :user_id, :date_1, :date_2, :date_3, :date_4, :date_5, :date_6, :date_7).merge(job_id: params[:job_id])
  end
end
