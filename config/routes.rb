Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :listings
      resources :users do
        resources :listings, only: [:show, :index]
        resources :properties
      end
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
    end
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
