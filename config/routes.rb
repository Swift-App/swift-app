Rails.application.routes.draw do

  devise_for :users
  resources :devise

  root "static_pages#index"

  get 'static_pages/index'

  get 'static_pages/about'
end
