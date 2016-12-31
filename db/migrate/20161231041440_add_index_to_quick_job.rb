class AddIndexToQuickJob < ActiveRecord::Migration[5.0]
  def change
  	add_index :quick_jobs, :date
  end
end
