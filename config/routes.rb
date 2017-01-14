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
  get 'video', to: 'staff#video'

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
  resources :car_permit_applications, only: [:new, :create]
  resources :mynumber_applications, only: [:new, :create]
  resources :mynumber_declinals, only: [:new, :create]
  resources :quick_job_applications, only: [:new, :create]
  
  resources :payment_reservations, only: [:new, :create]

  resources :weekly_payment_applications, only: [:new, :create]
  resources :bank_applications, only: [:new, :create]

  patch 'registrations', to: 'registrations#update', as: "registration"
  
  resources :reservations, only: [:new, :create]

  resources :news_articles, only: [:index, :show]

  resources :registrations, only: [:new, :create]

  namespace :registrations do
    resources :reservations, only: :create
  end

  get 'registrations/step_1', to: 'registrations#step_1', as: 'registrations_step_1'
  get 'registrations/steps/agreement', to: 'registrations/steps#agreement', as: 'agreement'
  get 'registrations/steps/personal_information', to: 'registrations/steps#personal_information', as: 'personal_information'

  post 'next_step', to: 'registrations#next_step', as: 'next_step'
  post 'final_step', to: 'registrations#final_step', as: 'final_step'
  post 'set_confirming_false', to: 'registrations#set_confirming_false', as: 'set_confirming_false'
  post 'set_reservation_confirming_false', to: 'registrations/reservations#set_confirming_false', as: 'set_reservation_confirming_false'

  get 'registration/steps/:id', to: 'registrations/steps#show', as: 'registration_step'
end
