class CreateAttendenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :attendence_reports do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :report_type
      t.timestamps
    end
    add_index :attendence_reports, :user_id
    add_index :attendence_reports, :job_id
  end
end
