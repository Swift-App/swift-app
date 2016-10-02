Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :devise


  resources :jobs do
    resources :attendence_reports, only: [:new, :create]
    resources :reports
  end

end
