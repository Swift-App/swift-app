class AttendenceReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendence_report = AttendenceReport.new
  end

  def create
    @attendence_report = current_user.attendence_reports.new(attendence_report_params)
    if @attendence_report.save

      send_attendance_report_email

      flash[:success] = "終了報告が完了いたしました。"
      redirect_to staff_index_path
    else
      flash[:alert] = "エラーが起きました。大変申し訳ございませんが、もう一度内容をご確認の上送信してください。"
      render :new
    end
  end

  private

  def send_attendance_report_email
    UserMailer.attendance_report(user: current_user, attendance_report: @attendence_report).deliver_later
  end

  def attendence_report_params
    params.require(:attendence_report).permit(:report_type, :job_id, :user_id).merge(job_id: params[:job_id])
  end
end
