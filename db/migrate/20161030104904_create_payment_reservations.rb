class CreatePaymentReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_reservations do |t|
      t.references :user, foreign_key: true
      t.date :request_date
      t.date :date_1
      t.date :date_2
      t.date :date_3
      t.date :date_4
      t.date :date_5
      t.date :comments
      t.timestamps
    end
  end
end
