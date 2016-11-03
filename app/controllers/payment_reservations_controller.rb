class PaymentReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment_reservation = PaymentReservation.new
  end

  def create
    @payment_reservation = current_user.payment_reservations.new(payment_reservation_params)
    if @payment_reservation.save
      send_new_payment_reservation_email
      
      flash[:success] = "給与受取り予約が完了いたしました。"
      redirect_to staff_index_path
    else
      render :new
    end
  end

  private

  def send_new_payment_reservation_email
    UserMailer.payment_reservation_made(user: current_user, payment_reservation: @payment_reservation).deliver_later
  end

  def payment_reservation_params
    params.require(:payment_reservation).permit(:request_date, :date_1, :date_2, :date_3, :date_4, :date_5, :comments, :confirming)
  end
end
