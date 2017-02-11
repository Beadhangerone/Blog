Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  

  
  get '/profile' => 'profile#show', as: 'profile'
  get '/profile/followers' => 'profile#followers', as: 'profile_followers'
  get '/profile/followings' => 'profile#followings', as: 'profile_followings'

  get '/settings' => 'home#settings', as: 'settings'

  get '/settings/avatar' => 'avatar#edit', as: 'avatar'
  put 'settings/avatar/save/:id' => 'avatar#save', as: 'avatar_save'
  # get '/settings/avatar' => 'avatar#new', as: 'new_avatar'
  # post '/settings/avatar/create' => 'avatar#create', as: 'avatar_create'

  get '/user/:id/followers' => 'user#followers', as: 'user_followers'
  get '/user/:id/followings' => 'user#followings', as: 'user_followings'
  resources :user, :except => [:new, :create, :index]
  post '/user/:id/friend-up' =>"user#follow", as: 'follow'
  delete '/user/:id/unfollow' =>"user#unfollow", as: 'unfollow'

  get 'post/followings' => 'post#followings', as: 'followings_posts'
  get 'post/liked' => 'post#liked', as: 'liked_posts'
  resources :post do
    resources :comment, :except => [:show, :index, :new]
  end
  post '/post/:id/like' =>"post#like", as: 'like_post'
  delete '/post/:id/unlike' =>"post#unlike", as: 'unlike_post'

end
