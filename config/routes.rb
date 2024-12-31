Rails.application.routes.draw do
  root "home#index"
  resources :documents
  resources :users, only: [:edit, :update]

end
