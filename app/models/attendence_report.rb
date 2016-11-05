class AttendenceReport < ApplicationRecord
  validates :user_id, :report_type, presence: true

  REPORT_TYPES = ["出発報告", "集合報告"]
end
