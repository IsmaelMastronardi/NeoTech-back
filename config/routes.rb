Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        collection do
          post :create_temporary_user
        end
        resources :orders, only: [:show] do
          collection do
            post :fill_and_complete_order
          end
        end
      end
      resources :categories, only: [:index, :show]
      resources :items do
        collection do
          get :recentlyAdded
        end
      end
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end