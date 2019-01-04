Rails.application.routes.draw do
  resources :wikis, only: [:new, :create, :index, :show]
  devise_for :users
  root to: "home#index"
end
