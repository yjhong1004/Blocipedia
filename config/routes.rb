Rails.application.routes.draw do
  resources :charges, only:[:new, :create]
  delete 'charges_downgrade/downgrade'
  root "home#index"
  resources :collaborators, only: [:create, :destroy]
  get 'collaborators/create'
  resources :wikis
  devise_for :users
end
