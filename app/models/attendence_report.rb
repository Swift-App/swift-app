class AttendenceReport < ApplicationRecord
  validates :job_id, :user_id, :report_type, presence: true
  
  enum report_types: [:left_the_home, :reach_the_workplace]
end
