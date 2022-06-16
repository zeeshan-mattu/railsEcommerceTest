Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

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
