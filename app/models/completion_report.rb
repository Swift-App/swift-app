class CompletionReport < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user  
  
  validates :photo, :user_id, presence: true
end
