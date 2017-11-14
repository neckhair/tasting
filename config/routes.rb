Rails.application.routes.draw do
  root to: 'breweries#index'

  resources :breweries do
    resources :beers
  end
end
