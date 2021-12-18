Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :resipis do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end