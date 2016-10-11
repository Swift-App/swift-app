class ChangeColumnTypesForJobs < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :hours, :string
    change_column :jobs, :work_date, :string
    change_column :jobs, :number_of_positions, :string    
  end
end
