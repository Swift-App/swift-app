ActiveAdmin.register User do


  permit_params :unique_id, :last_name, :last_name_katakana, :first_name, :first_name_katakana, :gender, :email, :email_confirmation, :phone, :birthday, :postal_code, :prefecture, :city, :address_details, :photo, :emergency_last_name, :emergency_first_name, :emergency_relationship, :emergency_address, :emergency_phone, :from_a, :baitoru, :townwork, :enjapan, :mynavi, :shotworks, :an, :friend, :other_application_reason, :request_picking, :request_inspection, :request_devanning, :request_testing, :request_food, :request_packing, :request_printing, :request_line, :request_moving_assistant, :request_office_relocation, :request_assistant_distribution, :request_carry, :request_filing, :request_phone, :request_voucher_organization, :request_reception, :request_debug, :request_pc_setup, :request_data_entry, :request_other, :request_director, :request_event_organizer, :request_event_setup, :request_campaign, :request_sampling, :request_research, :request_sales, :request_register, :request_hall, :request_kitchen, :request_dish_washing, :password, :password_confirmation, :closest_station

  index do
    selectable_column
    id_column
    column :unique_id
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :first_name_katakana
    column :last_name_katakana
    actions
  end

  filter :unique_id
  filter :email
  filter :prefecture
  filter :city
  filter :birthday  
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "ユーザー登録" do    
      f.input :unique_id, placeholder: '５桁のIDを入力して下さい'
      f.input :last_name
      f.input :last_name_katakana      
      f.input :first_name
      f.input :first_name_katakana
      f.input :gender, collection: User.genders.keys      
      f.input :email
      f.input :email_confirmation
      f.input :phone, placeholder: 'ハイフンなしで入力して下さい（例：0908005400）'
      f.input :birthday, start_year: Date.today.year - 65,
                              end_year: Date.today.year - 16, default: Date.today - 35.years
      f.input :postal_code, placeholder: '（例：000-0000）'    
      f.input :prefecture
      f.input :city
      f.input :address_details
      f.input :closest_station
      f.input :photo
      f.input :emergency_last_name
      f.input :emergency_first_name
      f.input :emergency_relationship
      f.input :emergency_address
      f.input :emergency_phone
      f.input :from_a
      f.input :baitoru
      f.input :townwork
      f.input :enjapan
      f.input :mynavi
      f.input :shotworks
      f.input :an
      f.input :friend
      f.input :other_application_reason, label: false, placeholder: "その他"
      f.input :request_picking
      f.input :request_inspection
      f.input :request_devanning
      f.input :request_testing
      f.input :request_food
      f.input :request_packing
      f.input :request_printing
      f.input :request_line
      f.input :request_moving_assistant
      f.input :request_office_relocation
      f.input :request_assistant_distribution
      f.input :request_carry
      f.input :request_filing
      f.input :request_phone
      f.input :request_voucher_organization
      f.input :request_reception
      f.input :request_debug
      f.input :request_pc_setup
      f.input :request_data_entry
      f.input :request_other
      f.input :request_director
      f.input :request_event_organizer
      f.input :request_event_setup
      f.input :request_campaign
      f.input :request_sampling
      f.input :request_research
      f.input :request_sales
      f.input :request_register
      f.input :request_hall
      f.input :request_kitchen
      f.input :request_dish_washing
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
