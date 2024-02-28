
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        collection do
          post :create_guest_user
        end
        resources :orders, only: [:show] do
          collection do
            post :complete_order
            post :add_item
            get :show_current_order
            get :show_past_orders
            delete :remove_one_item
            delete :remove_item
          end
        end
      end
      resources :categories, only: [:index, :show]
      resources :items do
        collection do
          get :recently_added
        end
      end
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
