Rails.application.routes.draw do
  root to: 'beers#index'

  resources :beers, only: [:index]

  resources :breweries do
    resources :beers, controller: 'breweries/beers'
  end

  resources :beers, only: [] do
    resources :supplies
  end

  resources :categories, only: :index
  resources :suppliers
end
