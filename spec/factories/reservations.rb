FactoryGirl.define do
  factory :reservation do
      date_1 Date.today + 3.days
      date_2 Date.today + 4.days
      date_3 Date.today + 5.days
      date_4 Date.today + 6.days
      date_5 Date.today + 7.days
      date_6 Date.today + 8.days
      date_7 Date.today + 9.days
      additional_notes "additional_notes"
  end
end
