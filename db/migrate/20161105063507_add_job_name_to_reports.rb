class AddJobNameToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :completion_reports, :job_name, :string
    add_column :attendence_reports, :job_name, :string
  end
end
