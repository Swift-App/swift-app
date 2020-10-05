class Staff::ContactsController < ApplicationController
  def new
    @contact = StaffContact.new
  end

  def create
    @contact = StaffContact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'ご連絡ありがとうございました。'
      redirect_to root_path
    else
      flash.now[:alert] = 'エラーが起きました。もう一度内容をご確認の上送信ボタンを押してください。'
      render :new
    end
  end

  private

  def contact_params
    params.require(:staff_contact).permit(:name, :furigana, :birthday, :terms_and_conditions, :phone, :email, :interview_date, :other)
  end
end
