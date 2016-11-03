class RenameJobConfirmation < ActiveRecord::Migration[5.0]
  def change
    rename_table :job_confirmations, :confirmations
  end
end
