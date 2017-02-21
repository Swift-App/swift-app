crumb :root do
  link "ホーム", root_path
end

crumb :news_articles do
  link "ニュース一覧", news_articles_path
end

crumb :news_article do |news_article|
  link news_article.title, news_article_path(news_article)
  parent :news_articles
end

crumb :jobs do
  link "お仕事検索", jobs_path
end

crumb :job do |job|
  link job.title, job_path(job)
  parent :jobs
end

crumb :faq do |faq|
  link 'よくある質問', faq_path
  parent :root
end

crumb :faq_category do |faq_category|
  link faq_category.name, faq_category_path(faq_category)
  parent :faq
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).