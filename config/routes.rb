Rails.application.routes.draw do
  root "home#index"
  resources :wikis, only: [:new, :create, :index, :show]
  devise_for :users
end
