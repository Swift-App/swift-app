class Registrations::ReservationsController < ApplicationController
	RESERVATION_STEP = 5

	def create
		@user = session[:user]
		
		@reservation = Reservation.new(reservation_params)
		@reservation.before_user_creation = true

		
		if @reservation.valid?
			set_reservation_session		
			increment_step!
			redirect_to registration_step_path(RESERVATION_STEP + 1)
		else
			set_reservation_session		
			render "/registrations/steps/#{RESERVATION_STEP}"			
		end
	end

	def set_confirming_false
		@reservation = session[:reservation]
		@reservation.attributes = {confirming: nil}
		set_reservation_session

		redirect_to registration_step_path(RESERVATION_STEP)
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
