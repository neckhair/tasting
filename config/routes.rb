Rails.application.routes.draw do
  root to: 'breweries#index'

  resources :breweries do
    resources :beers
  end

  resources :beers, only: [] do
    resources :supplies
  end

  resources :categories, only: :index
  resources :suppliers
end
