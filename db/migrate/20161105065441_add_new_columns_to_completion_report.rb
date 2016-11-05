class AddNewColumnsToCompletionReport < ActiveRecord::Migration[5.0]
  def change
    add_column :completion_reports, :breaktime, :integer
    add_column :completion_reports, :overtime, :integer
    add_column :completion_reports, :tardy_or_leave, :boolean, null: false, default: false
  end
end
