Rails.application.routes.draw do
  resources :charges, only:[:new, :create]
  delete 'charges_downgrade/downgrade'
  root "home#index"
  resources :wikis
  devise_for :users
end
