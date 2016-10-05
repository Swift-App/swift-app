ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
        column max_width: "400px", min_width: "100px" do
            panel "Recent Jobs" do 
                table_for Job.order("created_at desc").limit(5) do 
                    column :title do |job|
                        link_to job.title, [:admin, job]
                    end
                    column :created_at
                end
                strong { link_to "View all jobs...", admin_jobs_path }
            end
        end
    end
  end # content
end
