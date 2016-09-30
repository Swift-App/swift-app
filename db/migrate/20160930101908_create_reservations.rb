class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :job_id
      t.integer :user_id
      t.datetime :date_1
      t.datetime :date_2
      t.datetime :date_3
      t.datetime :date_4
      t.datetime :date_5
      t.datetime :date_6
      t.datetime :date_7
      t.text :additional_notes
      t.timestamps
    end

    add_index :reservations,:job_id
    add_index :reservations,:user_id
    add_foreign_key :reservations,:jobs
    add_foreign_key :reservations,:users
  end
end
