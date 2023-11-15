Rails.application.routes.draw do

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    collection do
      # custom index (subset/collection)
      # get "restaurants/top", to: "restaurants#top"
      get :top
    end

    member do
      # custom show (for one resource)
      get :chef
    end
  end

  resources :reviews, only: :destroy
end
