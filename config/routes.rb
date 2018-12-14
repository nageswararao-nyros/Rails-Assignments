Rails.application.routes.draw do
  
  get 'authors/index'
  resources :articles
  root 'articles#index'

  resources :authors
  root 'authors#index'
end
