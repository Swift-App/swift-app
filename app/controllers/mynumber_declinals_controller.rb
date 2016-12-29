class MynumberDeclinalsController < ApplicationController
	before_action :authenticate_user!

	def new
		@application = MynumberDeclinal.new
	end

	def create
		@application = current_user.mynumber_declinals.new(mynumber_declinal_params)

		if @application.save
			send_email!
			flash[:success] = "マイナンバー提出拒否理由書提出完了しました。"
			redirect_to staff_index_path
		else
			flash[:alert] = @application.errors.full_messages[0]
			render :new
		end
	end

	private

	def send_email!
		UserMailer.new_mynumber_declinal(application: @application, user: current_user).deliver_now
	end

	def mynumber_declinal_params
		params.require(:mynumber_declinal).permit(:reason, :other)
	end
end
