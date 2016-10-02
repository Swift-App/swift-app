Rails.application.routes.draw do

  devise_for :users
  resources :devise



  resources :jobs do
    resources :attendence_reports, only: [:new, :create]
  end
end
