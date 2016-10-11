class ChangeJobColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :pay_type
    remove_column :jobs, :pay_amount
    add_column :jobs, :pay_amount, :string
  end
end
