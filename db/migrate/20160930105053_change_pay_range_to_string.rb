class ChangePayRangeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :pay_range, :string
    change_column :jobs, :duration, :string
  end
end
