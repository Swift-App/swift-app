Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path_names: { sign_up: '' }

  ActiveAdmin.routes(self)

  
  root "static_pages#index"
  get 'about', to: 'static_pages#about'
  get 'steps', to: 'static_pages#steps'
  get 'companies', to: 'static_pages#companies'
  get 'staff/recruit', to: 'static_pages#staff'
  get 'new_staff', to: 'static_pages#new_staff'
  get 'company_contact', to: 'static_pages#company_contact'

  resources :staff, only: :index

  resources "contacts", only: [:new, :create]

  get 'companies/contact/new', to: 'company/contacts#new', as: 'new_company_contact'
  post 'companies/contacts', to: 'company/contacts#create', as: 'company_contacts'

  get 'staff/contact/new', to: 'staff/contacts#new', as: 'new_staff_contact'
  post 'staff/contacts', to: 'staff/contacts#create', as: 'staff_contacts'

  resources :jobs, only: [:index, :show] do
    resources :confirmations, only: [:index, :new, :create]
  end

  resources :completion_reports, only: [:new, :create]
  resources :attendence_reports, only: [:new, :create]

  resources :reservations, only: [:new, :create]

  resources :news_articles, only: [:index, :show]
end
