Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        member do
          get :show_past_orders
        end
        collection do
          post :create_temporary_user
        end
        resources :orders, only: [:show] do
          collection do
            post :complete_order
            post :add_item
            get :show_current_order
            post :remove_one_item
            post :remove_item
          end
        end
      end
      resources :categories, only: [:index, :show]
      resources :items do
        collection do
          get :recently_Added
        end
      end
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end