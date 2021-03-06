Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :machines, only: [:show, :update] do
        resources :snacks, only: [:index, :update, :show]
        resources :stocks, only: [:index, :update]
        resources :sales, only: [:create, :index]
        resources :money, only: [:index, :show, :update]
      end
    end
  end
end
