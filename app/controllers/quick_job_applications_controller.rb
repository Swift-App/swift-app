class QuickJobApplicationsController < ApplicationController
	before_action :authenticate_user!

	def create
		@application = current_user.quick_job_applications.build(quick_job_application_params)

		if @application.save
			send_email!
			flash[:success] = "お仕事登録が完了いたしました。"			
		else
			flash[:alert] = @application.errors.full_messages[0]
		end

		redirect_to jobs_path
	end

	private

	def send_email!
		UserMailer.new_quick_job_application(application: @application, user: current_user).deliver_now
	end

	def quick_job_application_params
		params.require(:quick_job_application).permit(:code)
	end
end
