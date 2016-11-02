class CompanyContact < MailForm::Base 
  attr_accessor :terms_and_conditions
  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone, :company_name, :postal_code, :prefecture, :city, :inquiry, :remarks, validates: true
  attribute :department, :person_in_charge, :furigana, :address_details, :website

  validates_acceptance_of :terms_and_conditions
  
  def headers
    {
      subject: "企業様お問い合わせ",
      to: "notification@swiftapp.com",
      from: %("#{company_name}" <#{email}>)
    }
  end
end
