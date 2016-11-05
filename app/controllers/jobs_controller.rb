class JobsController < ApplicationController
  def index
    @jobs = Job.filter(params.slice(:job_type, :area, :duration, :shift_category, :categories, :pay_range, :tag)).page(params[:page]).includes(:tags)
  end

  def show
    @job = Job.includes(:tags).find(params[:id]).decorate
  end
end
