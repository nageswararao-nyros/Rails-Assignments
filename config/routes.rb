Rails.application.routes.draw do

  
  root:to => 'softwarecompany#index'

  	get'/index' => 'softwarecompany#index'
  	get '/services' => 'softwarecompany#services'
  	get '/contactUs' => 'softwarecompany#contactUs'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
