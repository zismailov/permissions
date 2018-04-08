Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :permissions, only: :create do
        get :action_permitted, on: :collection
      end
      resources :users, only: :create
    end
  end
end
