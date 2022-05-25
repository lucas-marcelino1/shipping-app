Rails.application.routes.draw do
  devise_for :admins
  devise_for :carrier_users
  root "home#index"
  resources :carriers, only: [:new, :create, :edit, :update] do
    patch :to_able, on: :member
    patch :to_disable, on: :member
  end
  resources :deadlines, only: [:new, :create, :edit, :update, :index]
  resources :vehicles, only: [:index, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update] do 
    get :search, on: :collection
  end
  resources :service_orders, only: [:index, :new, :create, :show] do
    patch :to_accept, on: :member
    patch :to_reject, on: :member
    get :search, on: :collection
  end
  resources :route_updates, only: [:edit, :update] do
    post :create, on: :member
    patch :to_finish, on: :member
  end
end
