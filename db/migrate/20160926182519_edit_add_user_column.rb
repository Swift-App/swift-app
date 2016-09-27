class EditAddUserColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :name, :first_name
  	add_column :users, :last_name, :string
  	add_column :users, :first_name_katakana, :string
  	add_column :users, :last_name_katakana, :string
  	add_column :users, :phone, :integer
  	add_column :users, :birthday, :datetime
  	add_column :users, :zip_1, :integer
  	add_column :users, :zip_2, :integer
  	add_column :users, :prefecture, :string
  	add_column :users, :city, :string
  	add_column :users, :other_address, :string
  end
end
