Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/profile' => 'home#my_profile'
  post '/post/:id/like' =>"post#like", :as => 'like_post'
  delete '/post/:id/unlike' =>"post#unlike", :as => 'unlike_post'
  post '/user/:id/friend-up' =>"user#friend_up", :as => 'friend_up'
  delete '/user/:id/unfollow' =>"user#unfollow", :as => 'unfollow'
  
  resources :photos, only: [:new, :create, :index]
  resources :user, :except => [:new, :create, :index]
  resources :post do
    resources :comment, :except => [:show, :index, :new]
  end
end
