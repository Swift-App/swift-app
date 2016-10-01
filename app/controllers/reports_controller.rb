class ReportsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @job = Job.find(params[:job_id])
    @report = @job.reports.create(report_params.merge(user_id: current_user.id))
    if @report.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid attributes."
      redirect_to root_path
    end
  end

  def destroy

  end

  private 

  def report_params
    params.require(:report).permit(:photo, :comment, :job_id)
  end
end
