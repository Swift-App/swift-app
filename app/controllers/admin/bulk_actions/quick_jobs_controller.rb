class Admin::BulkActions::QuickJobsController < ApplicationController
  before_action :authenticate_admin_user!

  def new
  end

  def create
    jobs = jobs_params[:text]

    new_quick_jobs = []
    current_quick_job = QuickJob.new
    current_date = nil

    jobs.split(/\r\n/).each do |line|
      if line.match(/■\d{1,2}\/\d{1,2}\/\d{1,2}/)
        # Find date string
        date = line.match(/■\d{1,2}\/\d{1,2}\/\d{1,2}/)[0].gsub('■', '')
        date_str = date.split('/')
        current_date = Date.new("20#{date_str[0]}".to_i, date_str[1].to_i, date_str[2].to_i)

        new_quick_jobs << current_quick_job if current_quick_job.save

        current_quick_job = QuickJob.new(date: current_date)
      else
        current_quick_job.content = "#{current_quick_job.content}\r\n#{line.include?('コード') ? "\r\n" : ''}#{line}"
      end
    end

    new_quick_jobs << current_quick_job if current_quick_job.save

    flash[:notice] = "#{new_quick_jobs.length}件の仕事を作成しました。"
    redirect_to admin_bulk_actions_quick_jobs_path
  end

  private

  def jobs_params
    params.require(:quick_jobs).permit(:text)
  end

  def find_string_after(string, marker)
    string.split(marker).last
  end
end
