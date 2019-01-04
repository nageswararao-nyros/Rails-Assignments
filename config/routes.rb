Rails.application.routes.draw do
  
  devise_for :users

  resources :articles
  root 'articles#index'
  
  

  get "articles/download_file"
  get "articles/download_pdf"

  # get "search/index"
  # post "search/index"

  resources :admins
  get 'notify' => "admins#notify"

  resources :authors
  # resources :articles
  # resources :comments
  

  resources :articles do
    resources :comments
  end  

  # resources :articles, path: '/admin/articles'

  # resources :authors do
  #   member do
  #     get 'preview'
  #     get 'totalrecord'
  #   end
  # end

  resources :authors do
      get 'totalrecord', on: :member
      get 'preview', on: :member
      get 'download', on: :collection
  end
  

  get 'publishers' => "publishers#index"

  get 'publisher/new' => "publishers#new"

  post 'publishers' => "publishers#create"

  get 'publisher/:publisher_id' => 'publishers#show', as:"publisher"

  get 'publisher/:publisher_id/edit' => 'publishers#edit', as: :edit_publisher

  patch 'publisher/:publisher_id' => "publishers#update"

  delete 'publisher/:publisher_id' => 'publishers#destroy'
end
