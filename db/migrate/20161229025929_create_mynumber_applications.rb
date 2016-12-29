class CreateMynumberApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :mynumber_applications do |t|
      t.integer :user_id
      t.string :photo

      t.timestamps
    end
  end
end
