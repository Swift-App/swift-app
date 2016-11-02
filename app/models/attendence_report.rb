class AttendenceReport < ApplicationRecord
  validates :job_id, :user_id, :report_type, presence: true

  belongs_to :job

  REPORT_TYPES = ["出発報告", "集合報告"]
end
