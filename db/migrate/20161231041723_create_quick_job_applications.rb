class CreateQuickJobApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :quick_job_applications do |t|
      t.integer :user_id
      t.string :code

      t.timestamps
    end
    add_index :quick_job_applications, :user_id
    add_index :quick_job_applications, :code
  end
end
