class AddFeaturedPhotoToNewsArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :news_articles, :featured_photo, :string
  end
end
