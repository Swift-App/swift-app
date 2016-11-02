FactoryGirl.define do
  factory :staff_contact do
    name "田中太郎"
    furigana "たなかたろう"
    birthday "1980-01-01"
    terms_and_conditions "1"
    phone "111-1111-1111"
    email "example@test.com"
    interview_date "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                    proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end
end
