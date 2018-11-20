Rails.application.routes.draw do
  get '/hello'=> 'hello#index';
  root:to => 'hello#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
