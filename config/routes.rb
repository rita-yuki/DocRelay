Rails.application.routes.draw do
  root "home#index"
  resources :documents, only: [:index]
  resources :users, only: [:edit, :update]

  devise_for :users
end
