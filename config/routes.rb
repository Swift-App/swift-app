Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :devise

  root "jobs#index"

  resources :jobs do
    resources :attendence_reports, only: [:new, :create]
    resources :completion_reports
  end
end
