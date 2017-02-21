class AddClosestStationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :closest_station, :string
  end
end
