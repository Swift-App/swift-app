class AddDateToQuickJobApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :quick_job_applications, :date, :date
  end
end
