Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, skip: :registrations

  ActiveAdmin.routes(self)

  root "static_pages#index"

  get 'static_pages/index'
  get 'static_pages/about'
  
  resources "contacts", only: [:new, :create]

  resources :jobs do 
    resources :completion_reports
  end

end
