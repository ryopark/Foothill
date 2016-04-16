Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: 'sell_books#index'

  resources :top, only: [:index]

  resources :users

  resources :sell_books, except: [:edit, :update, :destroy]
  resources :sell_book_comments, only: [:new, :create]
  resources :message_groups, only: [:show, :create]

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
end
