class RegistrationsController < ApplicationController	
	USER_REGISTRATION_STEP = 2

	def create				
		@user = User.new(user_params)

		set_password					

		if @user.valid?
			set_user_session
			increment_step!			
			redirect_to registration_step_path(USER_REGISTRATION_STEP + 1)
		else			
			set_user_session
			render "/registrations/steps/#{USER_REGISTRATION_STEP}"
		end
	end

	def update				
		@user = session[:user]
		@user.attributes = user_params

		set_user_session

		increment_step!
		redirect_to registration_step_path(session[:step])
	end

	def next_step
		increment_step!
		redirect_to registration_step_path(session[:step])
	end

	def final_step	
		@user = session[:user]
		@reservation = session[:reservation]

		@user.save!
		@reservation.user = @user
		@reservation.save!

		flash[:success] = "ユーザー登録完了いたしました。メールアドレスに確認メールを送信いたしましたので、ご確認ください。"
		redirect_to root_path
	end

	def set_confirming_false
		@user = session[:user]
		@user.attributes = {confirming: nil}		
		set_user_session

		redirect_to registration_step_path(USER_REGISTRATION_STEP)
	end

	private

	def set_password
		@user.generate_password!
	end

	def increment_step!
		session[:step] = params[:current_step].to_i + 1
	end

	def set_user_session
		session[:user] = User.new(@user.attributes.except(:confirming).merge(password: @user.password, password_confirmation: @user.password_confirmation))		
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :first_name_katakana, :last_name_katakana, :email, :email_confirmation, :phone, :birthday, :postal_code, :prefecture, :city, :address_details, 
																 :emergency_first_name, :emergency_last_name, :emergency_relationship, :emergency_address, :emergency_phone, :application_medium, :request_picking, 
																 :request_inspection, :request_devanning, :request_testing, :request_food, :request_packing, :request_printing, :request_line, :request_moving_assistant, 
																 :request_office_relocation, :request_assistant_distribution, :request_carry, :request_filing, :request_phone, :request_voucher_organization, :request_reception, 
																 :request_debug, :request_pc_setup, :request_data_entry, :request_other, :request_director, :request_event_organizer, :request_event_setup, :request_campaign, 
																 :request_sampling, :request_research, :request_sales, :request_register, :request_hall, :request_kitchen, :request_dish_washing, :confirming, :password, :password_confirmation,
																 :daytime_student, :elder, :earnings_over_500, :householder_present, :from_a, :baitoru, :townwork, :enjapan, :mynavi, :shotworks, :an, :friend, :other_application_reason, :gender)
	end
end
