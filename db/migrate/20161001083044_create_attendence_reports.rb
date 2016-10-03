class CreateAttendenceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :attendence_reports do |t|
      t.integer :report_type
      t.integer :job_id
      t.integer :user_id
      t.timestamps
    end
  end
end
