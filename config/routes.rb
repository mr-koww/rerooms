Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :menu_items, only: %w[index]
    end

    namespace :dashboard do
      resources :menu_items, only: %w[index update] do
        member do
          get :activate
          get :disable
        end

        get :reset, on: :collection
      end
    end
  end
end
