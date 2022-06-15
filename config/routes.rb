Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: "shops#index"
  resources :items, shallow: true do
    resources :comments, only: %i[create edit update destroy]
  end

  resources :shops, only:[:index, :show]
  resources :order_items
  resource  :cards, only:[:show]

  delete "clearCart", to: "order_items#clearCart"
  post "checkouts/create", to: "checkouts#create"
  get "/search", to: "shops#search"
  
end
