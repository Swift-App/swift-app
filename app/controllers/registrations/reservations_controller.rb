class Registrations::ReservationsController < ApplicationController
	def create
		@user = session[:user]
		
		@reservation = Reservation.new(reservation_params)
		@reservation.before_user_creation = true

		@reservation.valid?		

		set_reservation_session		

		if @reservation.confirming.blank?
			redirect_to registration_step_path(params[:current_step])
		else
			increment_step!
			redirect_to registration_step_path(session[:step])
		end
	end

	private

	def increment_step!
		session[:step] = params[:current_step].to_i + 1
	end

	def set_reservation_session
		session[:reservation] = @reservation
	end

	def reservation_params
		params.require(:reservation).permit(:user_id, :date_1, :date_2, :date_3, :date_4, :date_5, :date_6, :date_7, :confirming)
	end
end
