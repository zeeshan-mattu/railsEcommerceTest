Rails.application.routes.draw do
  get 'cards/show'
  root to: "shops#index"
  resources :items
  resources :shops, only:[:index, :show]
  resources :order_items
  resource  :cards, only:[:show]

  post "checkouts/create", to: "checkouts#create"

  # resources :products
  # resources :comments

  devise_for :users

end
