FactoryGirl.define do
  factory :completion_report do
    comments "It was a good day."
    start_time Time.zone.now
    end_time Time.zone.now + 30.minutes
    date Date.today
  end
end
