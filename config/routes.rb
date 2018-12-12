Rails.application.routes.draw do
  
  resources :articles
  root 'articles#index'

  resources :authors
  root 'authors#index'
end
