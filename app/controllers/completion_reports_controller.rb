class CompletionReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @completion_report = CompletionReport.new
  end

  def create    
    @completion_report = current_user.completion_reports.create(completion_report_params)
    if @completion_report.valid?

      send_job_completion_email

      flash[:success] = "終了報告が完了いたしました。"
      redirect_to staff_index_path
    else
      flash[:alert] = "エラーが起きました。申し訳ございませんが、もう一度内容をご確認の上送信してください。"
      redirect_to staff_index_path
    end
  end

  private 

  def send_job_completion_email
    UserMailer.report_completion(user: current_user, completion_report_params: completion_report_params).deliver_later
  end

  def completion_report_params
    params.require(:completion_report).permit(:photo, :comments, :job_id)
  end
end
