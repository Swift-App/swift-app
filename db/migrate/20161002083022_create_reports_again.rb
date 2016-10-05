class CreateReportsAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :photo, :string
    add_column :reports, :comments, :text, null: false, minimum: 50
    add_column :reports, :user_id, :integer
    add_column :reports, :job_id, :integer
    add_index :reports, [:user_id, :job_id]
    add_index :reports, :job_id 

    add_foreign_key :reports, :users
    add_foreign_key :reports, :jobs
  end
end
