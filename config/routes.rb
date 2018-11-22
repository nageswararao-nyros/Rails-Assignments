Rails.application.routes.draw do

root:to=>'hello#index'

  get '/view' => 'hello#product'

  get '/about' => 'hello#about'
  
  get '/contact' => 'hello#contact'

  
 
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
