Rails.application.routes.draw do
  devise_for :admins
  devise_for :carrier_users
  root "home#index"
  resources :carriers, only: [:new, :create, :edit, :update]
  resources :deadlines, only: [:new, :create, :edit, :update, :index]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
  resources :service_orders, only: [:index, :new, :create, :show] do
    patch :to_accept, on: :member
    patch :to_reject, on: :member
  end
end
