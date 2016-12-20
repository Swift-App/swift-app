class WeeklyPaymentApplicationsController < ApplicationController
	before_action :authenticate_user!

	def new
		@application = WeeklyPaymentApplication.new
	end

	def create
		@application = current_user.weekly_payment_applications.new(weekly_payment_application_params)
		
		if @application.save
			flash[:success] = "申請完了いたしました。"
			redirect_to staff_index_path
		else
			flash[:alert] = @application.errors.full_messages[0]
			render :new
		end
	end

	private


	def weekly_payment_application_params
		params.require(:weekly_payment_application).permit(:image_1, :image_2, :image_3, :image_4, :image_5, :comment)
	end
end
