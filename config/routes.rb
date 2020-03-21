Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users
  # Custom routes for follow/unfollow

  resources :users, only: [:index, :show]
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :tweets, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
