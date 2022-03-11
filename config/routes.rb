Rails.application.routes.draw do 
  root 'users#index'
  devise_for :users, controllers: {
    registrations: "registrations"
  }
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: JSON } do
    resources :users, only: [:index] do 
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end 
