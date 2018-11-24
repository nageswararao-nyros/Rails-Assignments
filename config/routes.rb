Rails.application.routes.draw do
<<<<<<< HEAD
  
  root:to => 'softwarecompany#index'

  	get'/index' => 'softwarecompany#index'
  	get '/services' => 'softwarecompany#services'
  	get '/contactUs' => 'softwarecompany#contactUs'

=======

root:to=>'hello#index'

  get '/view' => 'hello#product'

  get '/about' => 'hello#about'
  
  get '/contact' => 'hello#contact'

  
 
  
>>>>>>> 865dd5b988ef1214d7ea49de90577e5e53344d48
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
