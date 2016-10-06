Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, skip: :registrations

  ActiveAdmin.routes(self)
  #devise_for :users
  resources :devise

<<<<<<< HEAD
  root "jobs#index"
=======
  resources "contacts", only: [:new, :create]
>>>>>>> 14bca22f1ee1806d238f396da0e003baac154487

  resources :jobs do 
    resources :completion_reports
  end
<<<<<<< HEAD
=======

>>>>>>> 14bca22f1ee1806d238f396da0e003baac154487
end
