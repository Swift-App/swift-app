class RemoveJobIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :job_id
  end
end
