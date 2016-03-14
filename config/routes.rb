Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: 'top#index'

  resources :top, only: [:index]

  resources :users

  resources :sell_books, except: [:edit, :update, :destroy]
end
