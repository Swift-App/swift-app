class CompletionReport < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user  
  
  validates :user_id, :start_time, :end_time, :job_name, presence: true
  validates :breaktime, length: {maximum: 3}

  after_create :send_job_completion_email

  private 

  def send_job_completion_email
    UserMailer.report_completion(user: user, completion_report: self).deliver_now
  end
end
