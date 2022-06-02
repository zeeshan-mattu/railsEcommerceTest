Rails.application.routes.draw do

  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'comments/destroy'
  get 'product/index'
  get 'product/show'
  get 'product/destroy'
  get 'product/edit'
  root to: "home#index"
  
  devise_for :users

end
