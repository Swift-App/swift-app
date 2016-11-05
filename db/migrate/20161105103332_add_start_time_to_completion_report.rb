class AddStartTimeToCompletionReport < ActiveRecord::Migration[5.0]
  def change
    add_column :completion_reports, :start_time, :time
    add_column :completion_reports, :end_time, :time    
    remove_column :completion_reports, :overtime
  end
end
