Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/profile' => 'home#my_profile'

  resources :post do
    resources :comment, :except => [:show, :index, :new]
  end
end
