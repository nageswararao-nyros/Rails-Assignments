class HelloController < ApplicationController

	  def index

	 	@sample = "Hello Nyros"	
	  
	  	@wish = "All the Best"

	 end

	 def product

	 	@sample = "Hello User"	
	  
	  	@wish = "we are all for you"

	 end

	 def  about

	 	@about_description = "we are conducting Ruby on Rails Projects"

	 	@interest = "if you are interested to join with Us:"

	 end

	 
end
