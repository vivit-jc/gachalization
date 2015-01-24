Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :home, only: [:index] do
  end
  
  root to: "home#index"

end
