class CompletionReport < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user  
  
  validates :user_id, presence: true
  validates :breaktime, :overtime, length: {maximum: 3}
end
