ActiveAdmin.register QuickJob do
	permit_params :content, :date


	form do |f|
	  f.inputs do
	  	f.input :date, as: :datepicker, hint: 'レギュラーの仕事を登録する場合は空白にしてください。'
      f.input :content
	  end
	  f.actions
	end

end
