class CompanyContact < MailForm::Base 
  attr_accessor :terms_and_conditions
  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :company_name, :person_in_charge, validates: true
  attribute :department, :furigana, :address_details, :website, :phone, 
            :postal_code, :prefecture, :city, :inquiry, :remarks

  validates_acceptance_of :terms_and_conditions
  
  def headers
    {
      subject: "企業様お問い合わせ",
      to: "info@info-swift.sakura.ne.jp",
      from: %("#{company_name}" <#{email}>)
    }
  end
end
