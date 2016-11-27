class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :job

  attr_accessor :terms_and_conditions
  validates_acceptance_of :terms_and_conditions
  
  delegate :title, to: :job, prefix: true  

	after_create :send_job_confirmation_email

	private

  def send_job_confirmation_email
    UserMailer.job_confirmation(user: user, confirmation: self).deliver_now
  end
end
