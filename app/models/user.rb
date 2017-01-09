class User < ApplicationRecord
  include Confirmable  

  KATAKANA_REGEX = /\p{Katakana}/

  enum gender: [:男性, :女性]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :confirmations, dependent: :destroy
  has_many :jobs, through: :confirmations
  has_many :reservations, dependent: :destroy
  has_many :attendence_reports, dependent: :destroy
  has_many :completion_reports, dependent: :destroy
  has_many :payment_reservations, dependent: :destroy
  has_many :weekly_payment_applications, dependent: :destroy
  has_many :bank_applications, dependent: :destroy
  has_many :car_permit_applications, dependent: :destroy
  has_many :mynumber_applications, dependent: :destroy
  has_many :mynumber_declinals, dependent: :destroy
  has_many :quick_job_applications, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validate :email_is_confirmed
  validates :email_confirmation, presence: true
  validates :unique_id, :first_name_katakana, :last_name_katakana, :birthday, :gender, presence: true
  validates :unique_id, length: {is: 5}
  validates_uniqueness_of :unique_id
  validates :first_name_katakana, format: {with: KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :last_name_katakana, format: {with: KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}

  before_validation :generate_password!
  # Generate once before validation and once after create
  before_validation :generate_unique_id!
  before_create :generate_unique_id!
  after_create :send_complete_signup_email
  after_create :send_new_user_registration_email


  def name
    "#{last_name} #{first_name}"
  end

  def name_katakana
    "#{last_name_katakana} #{first_name_katakana}"
  end

  def registered?(job:)
    jobs.include?(job)
  end

  def generate_password!
    self.password = birthday.to_s.split("-").join("")
    self.password_confirmation = birthday.to_s.split("-").join("")
  end

  def exception?
    elder || daytime_student || earnings_over_500 || householder_present
  end

  def address
    address = ""
    address << prefecture if prefecture
    address << city if city
    address << address_details if address_details    
  end

  def to_csv
    csv = UserCsvGenerator.new(self).generate!    
  end

  private

  def email_is_confirmed
    if email != email_confirmation
      errors.add(:email, "は確認用メールアドレスと異なります。")
    end
  end

  def send_complete_signup_email
    UserMailer.confirmation_email(user: self).deliver_now
  end

  def send_new_user_registration_email
    UserMailer.new_user_registration(user: self).deliver_now
  end

  def generate_unique_id!    
    self.unique_id = gender == "男性" ? unique_id_store.male + 1 : unique_id_store.female + 1
  end

  def unique_id_store
    UniqueIdStore.first
  end  
end
