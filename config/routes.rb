Rails.application.routes.draw do
  get "wikis/index"

  get "wikis/show"

  get "wikis/new"

  get "wikis/edit"
  devise_for :users
  root to: "home#index"
end
