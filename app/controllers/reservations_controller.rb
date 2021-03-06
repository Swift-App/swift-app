﻿class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
        
    if @reservation.save      
      flash[:success] = "お仕事予約が完了いたしました。"
      redirect_to staff_index_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit( :user_id, :date_1, :date_2, :date_3, :date_4, :date_5, :date_6, :date_7, :confirming)
  end
end
