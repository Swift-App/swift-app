class DeleteColumnsFromJob < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :job_type
    remove_column :jobs, :branch_in_charge
  end
end
