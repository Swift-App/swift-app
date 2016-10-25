Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path_names: { sign_up: '' }

  ActiveAdmin.routes(self)

  root "static_pages#index"
  get 'about', to: 'static_pages#about'
  get 'companies', to: 'static_pages#companies'
  get 'staff', to: 'static_pages#staff'

  resources "contacts", only: [:new, :create]

  resources :jobs do
    resources :completion_reports, only: [:new, :create]
    resources :attendence_reports, only: [:new, :create]
  end

  resources :reservations, only: [:new, :create]
  resources :news_articles

  mount MorriganEditorRails::Engine => "/morrigan_editor_rails" 
end
