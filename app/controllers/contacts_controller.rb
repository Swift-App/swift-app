class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'ご連絡ありがとうございました。'
      redirect_to root_path
    else
      flash.now[:alert] = 'エラーが起きました。もう一度内容をご確認の上送信ボタンを押してください。'
      redirect_to :back
    end
  end

  private 

  def contact_params
    params.require(:contact).permit(:name, :furigana, :birthday, :terms_and_conditions, :interview_date, :phone, :message, :company_name, :department, :person_in_charge, :postal_code, :prefecture, :city, :address_details, :website, :inquiry, :remarks, :email)
  end
end
