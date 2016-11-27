SIZE = 5
charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}

FactoryGirl.define do
  factory :user do
    sequence :unique_id do |n|
      (0...SIZE).map{ charset.to_a[rand(charset.size)] }.join       
    end
    sequence :email do |n|
       "random#{n}@email.com" 
    end
    password "codingiscool"
    password_confirmation "codingiscool"
    first_name "first_name"
    last_name "last_name"
    first_name_katakana "タロウ"
    last_name_katakana "ヤマモト"
    phone "08067397394"
    birthday Date.today-22.years
    postal_code "181-0015"    
    prefecture "prefecture"
    city "tokyo"
    address_details "other_address"
  end
end
