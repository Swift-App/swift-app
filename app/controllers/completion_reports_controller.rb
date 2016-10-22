class CompletionReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @completion_report = CompletionReport.new
  end

  def create    
    @completion_report = current_user.completion_reports.create(completion_report_params)
    if @completion_report.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid attributes."
      redirect_to root_path
    end
  end

  private 

  def completion_report_params
    params.require(:completion_report).permit(:photo, :comments, :job_id)
  end
end
