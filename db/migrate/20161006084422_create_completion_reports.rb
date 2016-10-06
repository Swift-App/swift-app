class CreateCompletionReports < ActiveRecord::Migration[5.0]
  def change
    create_table :completion_reports do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :photo
      t.text :comments
    end
    add_index :completion_reports, :user_id
    add_index :completion_reports, :job_id
  end
end
