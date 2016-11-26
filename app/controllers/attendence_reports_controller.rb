class AttendenceReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendence_report = AttendenceReport.new
  end

  def create
    @attendence_report = current_user.attendence_reports.new(attendence_report_params)
    if @attendence_report.save
      flash[:success] = "出発・到着報告が完了いたしました。"
      redirect_to staff_index_path
    else
      flash[:alert] = "エラーが起きました。大変申し訳ございませんが、もう一度内容をご確認の上送信してください。"
      render :new
    end
  end

  private

  def attendence_report_params
    params.require(:attendence_report).permit(:report_type, :job_name, :user_id)
  end
end
