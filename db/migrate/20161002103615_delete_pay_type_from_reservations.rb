class DeletePayTypeFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :pay_type
  end
end
