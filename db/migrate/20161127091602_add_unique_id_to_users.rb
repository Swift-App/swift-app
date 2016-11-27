class AddUniqueIdToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :unique_id, :string, unique: true
  	add_index :users, :unique_id
  end
end
