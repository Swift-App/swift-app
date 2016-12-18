class WeeklyPaymentApplication < ApplicationRecord
	mount_uploader :image_1, PhotoUploader
	mount_uploader :image_2, PhotoUploader
	mount_uploader :image_3, PhotoUploader
	mount_uploader :image_4, PhotoUploader
	mount_uploader :image_5, PhotoUploader

	belongs_to :user

	validates :image_1, :user, presence: true

	after_create :send_notification_email!

	private

	def send_notification_email!
		
	end
end
