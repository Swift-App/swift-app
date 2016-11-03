class ChangeReportTypesToString < ActiveRecord::Migration[5.0]
  def change
    change_column :attendence_reports, :report_type, :string
  end
end
