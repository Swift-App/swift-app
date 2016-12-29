class CreateCarPermitApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :car_permit_applications do |t|
      t.integer :user_id
      t.string :license
      t.string :insurance_papers
      t.string :inspection_certificate

      t.timestamps
    end
    add_index :car_permit_applications, :user_id
  end
end
