class AddUserIdToWeeklyPaymentApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :weekly_payment_applications, :user_id, :integer
    add_index :weekly_payment_applications, :user_id
  end
end
