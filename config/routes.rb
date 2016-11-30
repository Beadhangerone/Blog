Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  
  post '/post/:id/like' =>"post#like", as: 'like_post'
  delete '/post/:id/unlike' =>"post#unlike", as: 'unlike_post'
  post '/user/:id/friend-up' =>"user#friend_up", as: 'friend_up'
  delete '/user/:id/unfollow' =>"user#unfollow", as: 'unfollow'
  


  get '/profile' => 'profile#show', as: 'profile'
  get '/profile/followers' => 'profile#followers', as: 'profile_followers'
  get '/profile/followings' => 'profile#followings', as: 'profile_followings'

  get '/user/:id/followers' => 'user#followers', as: 'user_followers'
  get '/user/:id/followings' => 'user#followings', as: 'user_followings'

  get '/settings' => 'home#settings', as: 'settings'
  get '/settings/avatar' => 'avatar#new', as: 'new_avatar'
  post '/settings/avatar/create' => 'avatar#create', as: 'avatar_create'

  resources :user, :except => [:new, :create, :index]
  resources :post do
    resources :comment, :except => [:show, :index, :new]
  end
end
