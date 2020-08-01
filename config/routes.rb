Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users
  root 'users#index'

  resources :items
  root 'items#index'

  resources :bills
  root 'items#index'
end
