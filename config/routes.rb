Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/new'
  devise_for :users

  root 'appointments#index'

  resources :appointments
  resources :physicians


end
