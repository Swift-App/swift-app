class AddPayTypeToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :pay_type, :string
    change_column :jobs, :pay_amount, :integer
  end
end
