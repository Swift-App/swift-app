class CompletionReportsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @job = Job.find(params[:job_id])
    @completion_report = @job.completion_reports.create(completion_report_params.merge(user_id: current_user.id))
    if @completion_report.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid attributes."
      redirect_to root_path
    end
  end

  def destroy

  end

  private 

  def completion_report_params
    params.require(:completion_report).permit(:photo, :comments, :job_id)
  end
end
