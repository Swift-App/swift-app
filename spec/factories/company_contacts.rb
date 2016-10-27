FactoryGirl.define do
  factory :company_contact do
    email "example@gmail.com"
    phone "111-111-1111"
    company_name "株式会社テスト"
    postal_code "111-1111"
    prefecture "兵庫県"
    city "神戸市"
    inquiry "テキスト"
    remarks  "テキスト"
    department "部署名"
    person_in_charge　"担当者名"
    furigana "ふりがな"
    address_details "アパート名"
    website "http://www.example.com"
  end
end
