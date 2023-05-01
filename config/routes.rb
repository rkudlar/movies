Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'movies#index'

  resources :movies do
    resources :comments, only: %i[edit update create destroy]
    post :search, on: :collection
    post :fill_with_omdb, on: :collection
  end

  namespace :profiles do
    get 'edit'
    patch 'update'
  end
end
