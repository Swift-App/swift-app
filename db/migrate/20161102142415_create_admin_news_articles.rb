class CreateAdminNewsArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_news_articles do |t|

      t.timestamps
    end
  end
end
