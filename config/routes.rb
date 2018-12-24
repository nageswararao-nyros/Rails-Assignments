Rails.application.routes.draw do
  root 'sessions#create', as: 'index'

  get 'admin' => 'admin#index'
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

  get "search/index"
  post "search/index"

  resources :authors
  resources :articles
  resources :users
  root 'users#new'  

end
