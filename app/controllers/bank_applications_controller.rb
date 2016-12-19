class BankApplicationsController < ApplicationController
	before_action :authenticate_user!

	def new
		@bank_application = BankApplication.new
	end

	def create
		@bank_application = current_user.bank_applications.new(bank_application_params)

		if @bank_application.save
			flash[:success] = "申請完了しました。"
			redirect_to staff_index_path
		else
			flash[:alert] = @bank_application.errors.full_messages[0]
			render :new
		end
	end

	private

	def bank_application_params
		params.require(:bank_application).permit(:photo)
	end
end
