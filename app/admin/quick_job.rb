ActiveAdmin.register QuickJob do
	permit_params :content, :date


	form do |f|
	  f.inputs do
	  	f.input :date
      f.input :content
	  end
	  f.actions
	end

end
