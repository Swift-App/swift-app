class MynumberApplicationsController < ApplicationController
	before_action :authenticate_user!

	def new
		@application = MynumberApplication.new
	end

	def create
		@application = current_user.mynumber_applications.new(mynumber_application_params)

		if @application.save
			flash[:success] = "マイナンバー申請完了しました。"
			redirect_to staff_index_path
		else
			flash[:alert] = @application.errors.full_messages[0]
			render :new
		end
	end

	private

	def mynumber_application_params
		params.require(:mynumber_application).permit(:user_id, :photo)
	end
end
