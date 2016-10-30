class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      send_new_reservation_email
      
      flash[:success] = "追加予約が完了いたしました。"
      redirect_to staff_index_path
    else
      flash[:alert] = "エラーが起きました。大変申し訳ございませんが、もう一度内容をご確認の上送信してください。"
      render :new
    end
  end

  private

  def send_new_reservation_email
    UserMailer.reservation_made(user: current_user, reservation: @reservation).deliver_later
  end

  def reservation_params
    params.require(:reservation).permit( :user_id, :date_1, :date_2, :date_3, :date_4, :date_5, :date_6, :date_7)
  end
end
