class CreateBankApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_applications do |t|
      t.string :photo
      t.integer :user_id

      t.timestamps
    end
  end
end
