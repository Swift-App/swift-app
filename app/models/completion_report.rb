class CompletionReport < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user  
  
  validates :user_id, :start_time, :end_time, :job_name, presence: true
  validates :breaktime, length: {maximum: 3}

  delegate :unique_id, to: :user, prefix: true
end
