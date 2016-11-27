ActiveAdmin.register AttendenceReport do


  index do
    selectable_column
    column :created_at do |report|
      report.created_at.strftime("%m/%d/%Y %l:%M %p")
    end
    column :user do |report|
      report.user_unique_id
    end    
    column :report_type
    column :job_name
    actions
  end

  filter :user
  filter :job
  filter :report_type
  filter :job_name

  

end
