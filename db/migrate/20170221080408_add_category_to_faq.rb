class AddCategoryToFaq < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :faq_category_id, :integer, index: true
  end
end
