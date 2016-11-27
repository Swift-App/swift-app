class AttendenceReport < ApplicationRecord
  belongs_to :user

  validates :user_id, :report_type, presence: true

  REPORT_TYPES = ["出発報告", "集合報告"]

  after_create :send_attendance_report_email

  delegate :unique_id, to: :user, prefix: true

  private

  def send_attendance_report_email
    UserMailer.attendance_report(user: user, attendance_report: self).deliver_now
  end
end
