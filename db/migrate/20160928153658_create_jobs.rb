class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string   :title, null: false
      t.text     :description, null: false
      t.decimal  :pay_amount, null:false, default: 0.00
      t.string   :job_type
      t.string   :content
      t.string   :location
      t.string   :nearest_station
      t.integer  :number_of_positions
      t.date     :work_date
      t.integer  :hours
      t.string   :holidays
      t.string   :certifications_and_experience
      t.string   :benefits
      t.string   :employment_type
      t.string   :person_in_charge, null:false
      t.text     :remarks
      t.string   :branch_in_charge, null:false
      t.integer  :pay_range
      t.string   :area
      t.string   :shift_category
      t.time     :duration
      t.string   :category

      t.timestamps 
    end
  end
end
