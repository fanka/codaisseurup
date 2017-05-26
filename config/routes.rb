Rails.application.routes.draw do
  resources :categories
  get 'pages/home'

  root to: 'pages#home'
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :events do
    resources :registrations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
