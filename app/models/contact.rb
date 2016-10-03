class Contact < MailForm::Base 
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :phone
  attribute :message

  
  def headers
    {
      :subject => "Thank You",
      :to => "notification@swiftapp.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
