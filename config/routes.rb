Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations'}
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
  #   get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
  root to: 'sell_books#index'

  resources :top, only: [:index]

  resources :users do
    member do
      get :requested_books
      get :selling_books
    end
    resources :favorites, only: :index, controller: 'users/favorites'
  end
  resources :sell_books
  resources :sell_book_comments, only: [:new, :create]
  resources :message_groups, only: [:show, :create]
  resources :messages, only: :create
  resources :favorites, only: :create do
    post :remove, on: :collection
  end
end
