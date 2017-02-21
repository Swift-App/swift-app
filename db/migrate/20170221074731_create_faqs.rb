class CreateFaqs < ActiveRecord::Migration[5.0]
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :content
      t.integer :position
      t.timestamps
    end

    Faq.order(:updated_at).each.with_index(1) do |faq, index|
      faq.update_column :position, index
    end
  end
end
