Rails.application.routes.draw do
  root 'lists#index'

  devise_for :users
  resources :lists

  resources :lists do
    resources :artists
  end

  resources :artists do
    resources :songs
  end

end
