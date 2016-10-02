class Job < ApplicationRecord
  validates :title, :description, :pay_amount, :job_type, :content, :location, :nearest_station, 
            :number_of_positions, :work_date, :hours, :holidays, :certifications_and_experience, 
            :benefits, :employment_type, :person_in_charge, :remarks, :branch_in_charge, 
            :pay_range, :area, :shift_category, :duration, :category, presence: true

  has_many :reports
end
