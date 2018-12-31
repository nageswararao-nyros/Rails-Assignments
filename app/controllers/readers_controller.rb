class ReadersController < ApplicationController
  
  def index
  
  end
 
  def show
    
  end
 
  def new
    
  end
 
  def edit
      
  end
 
  def create

   
 
  def update
   
  end
 
  def destroy
   
   end

  def download_pdf
  
  end

  def download_file
    
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :story, :author_id, :poster, :id)
    end

    def generate_pdf(article)
     
    end
end
