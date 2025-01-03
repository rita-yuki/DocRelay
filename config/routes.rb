Rails.application.routes.draw do
  devise_for :users
  resources :documents, only: [:index, :new, :create]
  resources :users, only: [:edit, :update]
  root "home#index" 
end
