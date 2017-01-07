class CreateUniqueIdStores < ActiveRecord::Migration[5.0]
  def change
    create_table :unique_id_stores do |t|
      t.integer :male, default: 0
      t.integer :female, default: 0

      t.timestamps
    end
  end
end
