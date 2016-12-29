class CarPermitApplication < ApplicationRecord
	attr_accessor :terms_and_conditions
	validates_acceptance_of :terms_and_conditions

	validates :license, :inspection_certificate, :user, presence: true

	belongs_to :user

	mount_uploader :license, PhotoUploader
	mount_uploader :insurance_papers, PhotoUploader
	mount_uploader :inspection_certificate, PhotoUploader
end
