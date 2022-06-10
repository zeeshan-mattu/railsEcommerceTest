Rails.application.routes.draw do

  devise_for :users
  root to: "shops#index"
  resources :items do
    resources :comments, only: %i[create edit update destroy]
  end

  resources :shops, only:[:index, :show]
  resources :order_items
  resource  :cards, only:[:show]

  post "checkouts/create", to: "checkouts#create"

end
