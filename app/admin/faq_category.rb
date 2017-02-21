ActiveAdmin.register FaqCategory do
  config.paginate   = false

  reorderable

  # Reorderable Index Table
  index as: :reorderable_table do    
    column :name
    actions
  end

  show do |faq_category|
    attributes_table do
      row :name
    end

    # Reorderable Subtable
    # Note: you must include `reorderable` in the ActiveAdmin configuration for the resource
    # being sorted. See the `Part` example above this code block.
    reorderable_table_for faq_category.faqs do
      column :title
      column :content
    end
  end

  form do |f|
    f.inputs do
      f.input :name      
    end
    f.actions

    reorderable_table_for faq_category.faqs do
      column :title
      column :content
    end
  end
end