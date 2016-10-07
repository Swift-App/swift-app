Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path_names: { sign_up: '' }

  ActiveAdmin.routes(self)

  root "jobs#index"
  resources "contacts", only: [:new, :create]

  resources :jobs do
    resources :completion_reports, only: [:new, :create]
    resources :attendence_reports, only: [:new, :create]
  end

  resources :reservations, only: [:new, :create]
end
