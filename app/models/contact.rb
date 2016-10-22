class Contact < MailForm::Base 
  attr_accessor :terms_and_conditions
  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name, :furigana, :birthday, :interview_date, :phone, :company_name, :department, :person_in_charge, :postal_code, :prefecture, :city, :address_details, :website, :inquiry, :remarks 

  validates_acceptance_of :terms_and_conditions
  
  def headers
    {
      subject: "お問い合わせ",
      to: "notification@swiftapp.com",
      from: %("#{name || company_name}" <#{email}>)
    }
  end
end
