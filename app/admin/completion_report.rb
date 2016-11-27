ActiveAdmin.register CompletionReport do


  index do
    selectable_column
    column :created_at do |report|
      report.created_at.strftime("%m/%d/%Y %l:%M %p")
    end
    column :user do |report|
      report.user_unique_id
    end        
    column :job_name
    column :start_time do |report|
      report.start_time.strftime("%m/%d/%Y %l:%M %p")
    end
    column :end_time do |report|
      report.end_time.strftime("%m/%d/%Y %l:%M %p")
    end
    column :break_time do |report|
      "#{report.breaktime}分"
    end
    column :tardy_or_leave do |report|
      report.tardy_or_leave ? "有" : "無"
    end
    actions
  end

  filter :created_at
  filter :user
  filter :job_name
  filter :start_time
  filter :end_time
  filter :break_time
  filter :tardy_or_leave

end
