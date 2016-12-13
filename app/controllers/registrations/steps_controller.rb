class Registrations::StepsController < ApplicationController
	def show
		@user = session[:user] || User.new				
	end
end
