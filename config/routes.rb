Rails.application.routes.draw do 
  root 'users#index'
  resources :users, only: %i[index show]
  resources :user_posts, only: %i[index show]
end 
