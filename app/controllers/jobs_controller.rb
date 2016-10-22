class JobsController < ApplicationController
  def index
    @jobs = Job.filter(params.slice(:job_type, :area, :duration, :shift_category, :categories))
  end

  def show
    @job = Job.find(params[:id])
  end

  def create

  end

  def destroy 

  end
end
