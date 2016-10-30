FactoryGirl.define do
  factory :payment_reservation do
    user nil
    request_date Date.today + 2.days
    date_1 "2016-10-30"
    date_2 "2016-10-30"
    date_3 "2016-10-30"
    date_4 "2016-10-30"
    date_5 "2016-10-30"
  end
end
