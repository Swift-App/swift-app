Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, skip: :registrations

  ActiveAdmin.routes(self)
  #devise_for :users
  resources :devise

  resources "contacts", only: [:new, :create]


  resources :jobs do 
    resources :completion_reports, only: [:new, :create]
    resources :attendence_reports, only: [:new, :create]
  end

end
