class User < ApplicationRecord
  include Confirmable  

  KATAKANA_REGEX = /\p{Katakana}/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :confirmations, dependent: :destroy
  has_many :jobs, through: :confirmations
  has_many :reservations, dependent: :destroy
  has_many :attendence_reports, dependent: :destroy
  has_many :completion_reports, dependent: :destroy
  has_many :payment_reservations, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  validates :unique_id, :first_name_katakana, :last_name_katakana, presence: true
  validates :unique_id, length: {is: 5}
  validates_uniqueness_of :unique_id
  validates :first_name_katakana, format: {with: KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  validates :last_name_katakana, format: {with: KATAKANA_REGEX, message: 'はカタカナで入力して下さい。'}
  # validates :postal_code, format: {with: POSTAL_CODE_REGEX, message: 'は「000-0000」のフォーマットで入力して下さい。'}
  # validates :phone, format: {with: PHONE_REGEX, message: 'は「00000000000」のフォーマットで入力して下さい。'}

  before_validation :generate_password!
  before_validation :generate_unique_id!

  def name
    "#{last_name} #{first_name}"
  end

  def name_katakana
    "#{last_name_katakana} #{first_name_katakana}"
  end

  def registered?(job:)
    jobs.include?(job)
  end

  private

  def generate_password!
    self.password = birthday.to_s.split("-").join("")
  end

  def generate_unique_id!    
    self.unique_id = UniqueIdGenerator.new.generate!
  end
end
