class StaffController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index

  end

  def video

  end
end
