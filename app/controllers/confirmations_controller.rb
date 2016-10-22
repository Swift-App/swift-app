class ConfirmationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @confirmation = Confirmation.new
  end

  def create
    @confirmation = current_user.confirmations.new(job_id: params[:job_id])

    if @confirmation.save
      flash[:success] = "お申し込み完了いたしました。"
      redirect_to root_path
    else
      flash[:alert] = "エラーが起きました。"
      render :new
    end
  end

end
