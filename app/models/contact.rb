class Contact < MailForm::Base 
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  arrribute :phone_number
  attribute :message

  
  def headers
    {
      :subject => "Thank You",
      :to => "notification@swiftapp.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
