Rails.application.routes.draw do

  root 'jobs#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :devise

end
