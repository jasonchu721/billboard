Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do
    resources :artists
  end

  resources :artists do
    resources :songs
  end

end
