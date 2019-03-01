Rails.application.routes.draw do
  resources :charges, only:[:new, :create]

  delete 'charges_downgrade/downgrade_user'
  root "home#index"
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
    get 'collaborators/create'
    get 'collaborators/destroy'
  end
  devise_for :users
end
