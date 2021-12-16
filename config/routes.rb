Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :resipis do
    resources :comments, only: [:create, :destroy]
  end
end