FactoryGirl.define do
  factory :user do
    sequence :email do |n|
       "random#{n}@email.com" 
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    first_name "first_name"
    last_name "last_name"
    first_name_katakana "first_name_katakana"
    last_name_katakana "last_name_katakana"
    phone "0806747394"
    birthday Date.today-22.years
    zip "181-0015"    
    prefecture "prefecture"
    city "tokyo"
    address_details "other_address"
  end
end
