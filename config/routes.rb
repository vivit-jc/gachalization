Rails.application.routes.draw do

  devise_for :users
  resources :home, only: [:index] do
    post :gacha, on: :collection
    get :debug, on: :collection
  end

  resources :players, only: [:edit, :update]

  resources :countries, only: [:index,:show,:edit,:update]

  resources :trades, only: [:index, :create]

  root to: "home#index"

end
