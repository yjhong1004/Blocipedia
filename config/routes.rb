Rails.application.routes.draw do
  resources :charges, only:[:new, :create]
  delete 'charges_downgrade/downgrade'
  root "home#index"
  resources :wikis do
  resources :collaborators, only: [:create, :destroy]
  get 'collaborators/create'
  end
  devise_for :users
end
