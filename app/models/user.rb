class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :confirmations, dependent: :destroy
  has_many :jobs, through: :confirmations
  has_many :reservations, dependent: :destroy
  has_many :attendence_reports
  has_many :completion_reports

  mount_uploader :photo, PhotoUploader
end
