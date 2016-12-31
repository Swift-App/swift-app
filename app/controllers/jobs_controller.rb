class JobsController < ApplicationController
  def index
    @jobs = Job.filter(params.slice(:job_type, :area, :duration, :shift_category, :categories, :pay_range, :tag)).page(params[:page]).includes(:tags)
   	@quick_jobs = QuickJob.where(date: Date.today..(Date.today + 2.weeks))
  end

  def show
    @job = Job.includes(:tags).find(params[:id]).decorate
  end
end
