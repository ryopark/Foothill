Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: 'sell_books#index'

  resources :top, only: [:index]

  resources :users

  get 'users/:id/message_list', to: 'users#message_list', as: :user_message_list

  resources :sell_books, except: [:edit, :update, :destroy]
  resources :sell_book_comments, only: [:new, :create]
  resources :message_groups, only: [:show, :create]
  resources :messages, only: :create
  resources :favorites, only: [:index, :create] do
    post :remove, on: :collection
  end

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
end
