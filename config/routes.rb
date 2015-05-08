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

  resources :trades, except: [:new] do
    post :buy, on: :member
  end

  resources :letters, only: [:index,:show,:new,:create] do
    post :accept, on: :member
    post :reject, on: :member
    post :open_present, on: :member
  end

  resources :cards, only: [] do
    get  :improve,   on: :member
    post :improving, on: :collection
    get  :trade,     on: :member
  end

  root to: "home#index"

end
