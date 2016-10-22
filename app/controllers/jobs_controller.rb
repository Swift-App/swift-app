class JobsController < ApplicationController
  def index
    @jobs = Job.filter(params.slice(:job_type, :area, :duration, :shift_category, :categories)).page(params[:page])
  end

  def show
    @job = Job.find(params[:id])
  end
end
