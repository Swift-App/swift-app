class RemoveZipFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :zip_2
    rename_column :users, :zip_1, :postal_code
    rename_column :users, :other_address, :address_details
  end
end
