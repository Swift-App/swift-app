class AddMetaDescriptionToNewsArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :news_articles, :meta_description, :text
  end
end
