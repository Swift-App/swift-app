ActiveAdmin.register Faq do
  reorderable

  # config.sort_order = 'position_asc' # assuming Widget.insert_at modifies the `position` attribute
  # config.paginate   = false

  permit_params :title, :content, :faq_category_id


  form do |f|
    f.inputs do
      f.input :title      
      f.input :content, as: :ckeditor
      f.input :faq_category, collection: FaqCategory.all.map{|category| [category.name, category.id]}
    end
    f.actions
  end

end
