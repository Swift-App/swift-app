class MynumberApplication < ApplicationRecord
	belongs_to :user

	validates :user, :photo, presence: true

	mount_uploader :photo, PhotoUploader
end
