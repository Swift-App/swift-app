class ChangeReservationDatesToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :date_1, :date
    change_column :reservations, :date_2, :date
    change_column :reservations, :date_3, :date
    change_column :reservations, :date_4, :date
    change_column :reservations, :date_5, :date
    change_column :reservations, :date_6, :date
    change_column :reservations, :date_7, :date
  end
end
