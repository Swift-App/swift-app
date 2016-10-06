class AttendenceReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendence_report = AttendenceReport.new
  end

  def create
    @attendence_report = current_user.attendence_reports.create(attendence_report_params)
    if @attendence_report.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def attendence_report_params
    params.require(:attendence_report).permit(:report_type, :job_id, :user_id).merge(job_id: params[:job_id])
  end
end
