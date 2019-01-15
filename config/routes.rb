Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  root "home#index"
  resources :wikis
  devise_for :users
end
