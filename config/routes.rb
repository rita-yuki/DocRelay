Rails.application.routes.draw do
  devise_for :users
  resources :documents, only: [:index, :new, :create]

  get 'users/edit', to: 'users#edit', as: 'edit_user'
  patch 'users', to: 'users#update', as: 'user'
  root "home#index"
end
