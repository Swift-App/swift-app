ActiveAdmin.register User do


  permit_params :email, :password, :first_name, :last_name, :first_name_katakana, 
                :last_name_katakana, :phone, :birthday, :zip_1, :zip_2, :prefecture, 
                :city, :other_address, :photo, :unique_id
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
      f.input :email
      f.input :phone
      f.input :birthday, start_year: Date.today.year - 65,
                              end_year: Date.today.year - 16, default: Date.today - 35.years
      f.input :postal_code     
      f.input :prefecture
      f.input :city
      f.input :address_details
      f.input :photo
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
