Rails.application.routes.draw do
  # resources :cart_items
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :categories, only: [:index,  :show]
      resources :items do
        collection do
          get :recentlyAdded
        end
      end
      resources :users, only: [:show, :create, :delete] do
        resources :carts
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
