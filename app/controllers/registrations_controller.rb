class RegistrationsController < ApplicationController
	USER_REGISTRATION_STEP = 2

	def new

	end

	def create
		@user ||= User.new(user_params)		

		@user.valid?

		set_user_session

		redirect_to registration_step_path(USER_REGISTRATION_STEP)
	end

	def next_step
		session[:step] = params[:current_step].to_i + 1
		redirect_to registration_step_path(session[:step])
	end

	private

	def set_user_session
		session[:user] = @user
	end

	def increment_step!
		session[:step] += 1
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :email, :phone, :birthday, :postal_code, :prefecture, :city, :address_details, 
																 :emergency_first_name, :emergency_last_name, :emergency_relationship, :emergency_address, :emergency_phone, :application_medium, :request_picking, 
																 :request_inspection, :request_devanning, :request_testing, :request_food, :request_packing, :request_printing, :request_line, :request_moving_assistant, 
																 :request_office_relocation, :request_assistant_distribution, :request_carry, :request_filing, :request_phone, :request_voucher_organization, :request_reception, 
																 :request_debug, :request_pc_setup, :request_data_entry, :request_other, :request_director, :request_event_organizer, :request_event_setup, :request_campaign, 
																 :request_sampling, :request_research, :request_sales, :request_register, :request_hall, :request_kitchen, :request_dish_washing, :confirming)
	end
end
