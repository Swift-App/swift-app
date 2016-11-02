class ChangePayRangeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :pay_range, :string
  end
end
