class CreateQuickJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :quick_jobs do |t|
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
