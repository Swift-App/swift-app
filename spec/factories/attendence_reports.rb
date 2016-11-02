FactoryGirl.define do
  factory :attendence_report do
      report_type AttendenceReport::REPORT_TYPES[0]
  end
end
