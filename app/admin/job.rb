ActiveAdmin.register Job do


  permit_params :title, :description, :pay_amount, :job_type, :content, :location, 
                :nearest_station, 
                :number_of_positions, :work_date, :hours, :holidays, 
                :certifications_and_experience, 
                :benefits, :employment_type, :person_in_charge, :remarks, :branch_in_charge, 
                :pay_range, :area, :shift_category, :duration, :category

  index do 
    column :id
    column :title do |job|
      link_to job.title, [:admin,job]
    end
    column :description
    column :job_type
  end



end
