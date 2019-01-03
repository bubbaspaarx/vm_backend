Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :machines, only: [:show] do
        resources :snacks, only: [:index, :update, :show]
        resources :stocks, only: [:index, :update]
        resources :sales, only: [:create, :index]
        resources :money, only: [:index, :show]
      end
    end
  end
end
