class BankApplication < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	
	attr_accessor :terms_and_conditions

	validates_acceptance_of :terms_and_conditions
	validates :photo, presence: true

	belongs_to :user

	after_create :send_notification_email!

	private

	def send_notification_email!
		
	end
end
