Rails.application.routes.draw do
  devise_for :admins
  devise_for :carrier_users
  root "home#index"
  resources :carriers, only: [:new, :create, :edit, :update]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
end
