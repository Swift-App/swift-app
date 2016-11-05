ActiveAdmin.register NewsArticle do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :content, :meta_description, :featured_photo
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	form do |f|
	  f.inputs do
	    f.input :title      
	    f.input :content, as: :ckeditor
      f.input :meta_description
      f.input :featured_photo
	  end
	  f.actions
	end

end
