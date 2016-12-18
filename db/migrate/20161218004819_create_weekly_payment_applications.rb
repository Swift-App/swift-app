class CreateWeeklyPaymentApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_payment_applications do |t|
    	t.string :image_1
    	t.string :image_2
    	t.string :image_3
    	t.string :image_4
    	t.string :image_5
    	t.text :comment
      t.timestamps
    end
  end
end
