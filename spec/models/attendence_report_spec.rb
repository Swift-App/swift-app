require 'rails_helper'

RSpec.describe AttendenceReport, type: :model do
  it {should validate_presence_of :user_id}
  it {should validate_presence_of :job_id}
  it {should validate_presence_of :report_type}
end
