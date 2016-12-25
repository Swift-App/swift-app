class AddMoreDateFieldsToReservations < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :date_8, :date
  	add_column :reservations, :date_9, :date
  	add_column :reservations, :date_10, :date
  	add_column :reservations, :date_11, :date
  end
end
