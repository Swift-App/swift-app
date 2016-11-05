class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    return if table_exists? :reservations
    create_table :reservations do |t|
      t.datetime :date_1
      t.datetime :date_2
      t.datetime :date_3
      t.datetime :date_4
      t.datetime :date_5
      t.datetime :date_6
      t.datetime :date_7
      t.text :additional_notes
      t.integer :user_id
    end
    add_index :reservations, :user_id
  end
end
