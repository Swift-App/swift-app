class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :photo 
      t.text :comments, minimum: 50, null:false
      t.integer :user_id
      t.integer :job_id
      t.timestamps
    end
    add_index :reports, [:user_id, :job_id]
    add_index :reports, :job_id 
  end
end
