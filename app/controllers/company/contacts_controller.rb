class Company::ContactsController < ApplicationController
  def new
    @contact = CompanyContact.new
  end

  def create
    @contact = CompanyContact.new(contact_params)
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
    params.require(:company_contact).permit(:furigana, :terms_and_conditions, :phone, :message, :company_name, :department, :person_in_charge, :postal_code, :prefecture, :city, :address_details, :website, :inquiry, :remarks, :email)
  end
end
