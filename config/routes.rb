Rails.application.routes.draw do
  root to: "home#index"
  resources :products
  resources :comments

  devise_for :users

end
