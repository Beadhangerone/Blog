Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  get '/profile' => 'home#my_profile'

  resources :post
end
