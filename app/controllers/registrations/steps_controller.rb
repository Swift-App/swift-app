class Registrations::StepsController < ApplicationController
	def show
		@user = session[:user]
	end
end
