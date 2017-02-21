class IdentityConfirmation < ApplicationRecord
  belongs_to :user

  validates :user, :face_photo, :certificate, presence: true

  mount_uploader :face_photo, PhotoUploader 
  mount_uploader :certificate, PhotoUploader
end
