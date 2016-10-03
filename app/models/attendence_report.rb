class AttendenceReport < ApplicationRecord
  validates :job_id, :user_id, :report_type, presence: true

  enum report_type: [:reached_the_workplace, :left_the_workspace]
  belongs_to :job
  belongs_to :user
end
