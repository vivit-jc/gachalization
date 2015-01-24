Rails.application.routes.draw do

  devise_for :users
  resources :home, only: [:index] do
    post :gacha, on: :collection
  end
  
  root to: "home#index"

end
