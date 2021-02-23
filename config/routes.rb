Rails.application.routes.draw do
  devise_for :users
  resources :blog
  resources :comment, only: [:create]
  root 'blog#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
