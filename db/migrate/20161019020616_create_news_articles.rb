class CreateNewsArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :news_articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
