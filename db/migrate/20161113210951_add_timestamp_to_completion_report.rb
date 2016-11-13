class AddTimestampToCompletionReport < ActiveRecord::Migration[5.0]
  def change
    add_column :completion_reports, :created_at, :datetime, null: false
    add_column :completion_reports, :updated_at, :datetime, null: false
  end
end
