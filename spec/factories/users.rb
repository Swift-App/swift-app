FactoryGirl.define do
  factory :user do
    first_name "first_name"
    last_name "last_name"
    first_name_katakana "first_name_katakana"
    last_name_katakana "last_name_katakana"
    phone "0806747394"
    birthday Date.today-22.years
    zip_1 181
    zip_2 0015
    prefecture "prefecture"
    city "tokyo"
    other_address "other_address"
  end
end
