Rails.application.routes.draw do

  devise_for :users
  resources :home, only: [:index] do
    post :gacha, on: :collection
    get :debug, on: :collection
  end

  resources :players, only: [:edit, :update] do
    post :init, on: :collection
  end

  resources :countries, only: [:index,:show,:edit,:update]

  resources :trades, only: [:index, :create]

  resources :letters, only: [:index,:show,:new,:create]

  resources :cards, only: [] do
    get  :improve,   on: :member
    post :improving, on: :collection
  end

  root to: "home#index"

end
