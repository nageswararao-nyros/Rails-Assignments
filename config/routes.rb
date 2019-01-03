Rails.application.routes.draw do

  get 'publishers/index'
  get 'comments/index'
  root 'sessions#create'

  
  get 'logout' => 'sessions#destroy'
  get '/profile'=> 'users#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'signup'=>'users#new'
  get "sessions/create"
  get "sessions/destroy"
  get 'forgot_password' => "users#forgot_password"

  get "articles/download_file"
  get "articles/download_pdf"

  get "search/index"
  post "search/index"

  resources :admins
  get 'notify' => "admins#notify"

  resources :authors
  # resources :articles
  # resources :comments
  resources :users
  root 'users#new'

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
