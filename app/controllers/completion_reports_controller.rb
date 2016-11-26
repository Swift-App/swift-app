class CompletionReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @completion_report = CompletionReport.new
  end

  def create    
    @completion_report = current_user.completion_reports.new(completion_report_params)
    if @completion_report.save
      flash[:success] = "終了報告が完了いたしました。"
      redirect_to staff_index_path
    else
      flash[:alert] = "エラーが起きました。申し訳ございませんが、もう一度内容をご確認の上送信してください。"
      render :new
    end
  end

  private 

  def completion_report_params
    params.require(:completion_report).permit(:photo, :comments, :job_name, :tardy_or_leave, :breaktime, :start_time, :end_time)
  end
end
