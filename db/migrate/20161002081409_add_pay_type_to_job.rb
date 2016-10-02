class AddPayTypeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :pay_type, :string
  end
end
