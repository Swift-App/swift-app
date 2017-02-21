class IdentityConfirmationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @application = IdentityConfirmation.new
  end

  def create
    @application = current_user.identity_confirmations.new(identity_confirmation_params)

    if @application.save
      send_email!
      flash[:success] = "身分証・写真申請(本登録)完了しました。"
      redirect_to staff_index_path
    else
      flash[:alert] = @application.errors.full_messages[0]
      render :new
    end
  end

  private

  def send_email!
    UserMailer.new_identity_confirmation(application: @application, user: current_user).deliver_now
  end 

  def identity_confirmation_params
    params.require(:identity_confirmation).permit(:user_id, :face_photo, :certificate)
  end
end
