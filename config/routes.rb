Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'movies#index'

  resources :movies do
    post :fill_with_omdb, on: :collection
  end
end
