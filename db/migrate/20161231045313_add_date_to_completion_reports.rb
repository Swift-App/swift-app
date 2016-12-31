class AddDateToCompletionReports < ActiveRecord::Migration[5.0]
  def change
    add_column :completion_reports, :date, :date
  end
end
