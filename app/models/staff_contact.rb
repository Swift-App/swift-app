class StaffContact < MailForm::Base  
  attr_accessor :terms_and_conditions
  
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name, validate: true
  attribute :furigana, :birthday, :interview_date, :phone

  validates_acceptance_of :terms_and_conditions
  
  def headers
    {
      subject: "新規登録スタッフ",
      to: "info@info-swift.sakura.ne.jp",
      from: %("#{name}" <#{email}>)
    }
  end
end
