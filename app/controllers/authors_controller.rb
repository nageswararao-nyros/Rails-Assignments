class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @authors = Author.where(nationality:"Russia")
    
  end
  def show
    @author = Author.where("id = ?", params[:id])
    @authors_nationalities_not = Author.where.not(nationality:"American")
    @authors_nationalities_or = Article.where(title:"HelloNamasthe") .or(Article.where(story:"Welcome to Vizag")) 
  end
  private
    def article_params
      params.require(:author).permit(:id, :nationality, :name)
    end
end
