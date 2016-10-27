class CompletionReport < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :job
  
  validates :photo, :comments, :user_id, :job_id, presence: true
end
