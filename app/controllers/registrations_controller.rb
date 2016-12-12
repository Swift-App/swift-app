class RegistrationsController < ApplicationController

	def new

	end

	def create

	end

	def next_step
		session[:step] = params[:current_step].to_i + 1
		redirect_to registration_step_path(session[:step])
	end
end
