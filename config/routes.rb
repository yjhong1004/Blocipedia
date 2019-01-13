Rails.application.routes.draw do
  root "home#index"
  resources :wikis
  devise_for :users
end
