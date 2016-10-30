class AddBackColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_type, :string
    remove_column :jobs, :employment_type
  end
end
