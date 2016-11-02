class CreateJobConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :job_confirmations do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
