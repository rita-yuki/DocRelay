Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :documents, only: [:index, :new, :create] do
    resources :comments, only: [:index, :create, :destroy]
  end

  get 'users/edit', to: 'users#edit', as: 'edit_user'
  patch 'users', to: 'users#update', as: 'user'
  root "home#index"
end
